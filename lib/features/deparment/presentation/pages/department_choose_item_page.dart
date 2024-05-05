import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import '../bloc/department_bloc.dart';
import '../widgets/widget.dart';

class DepartmentChooseItemPage extends StatefulWidget {
  final Function(DepartmentItem) onDepartmentSelected;
  const DepartmentChooseItemPage(
      {super.key, required this.onDepartmentSelected});

  @override
  State<DepartmentChooseItemPage> createState() =>
      _DepartmentChooseItemPageState();
}

class _DepartmentChooseItemPageState extends State<DepartmentChooseItemPage> {
  final _searchController = TextEditingController();
  final DepartmentGetList _departmentGetList = const DepartmentGetList(
    currentPage: '1',
    pageSize: '10',
    filters: null,
    sortField: null,
    sortOrder: null,
  );
  final ScrollController _scrollController = ScrollController();

  DepartmentGetItem? _departmentGetItem;
  Timer? _debounce;
  String _previousText = '';
  bool _isLoading = false;
  bool _isSearch = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void didChangeDependencies() {
    context.read<DepartmentBloc>().add(_departmentGetList);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_departmentGetItem?.totalPages.toString() ==
        _departmentGetItem?.currentPage.toString()) {
      return;
    }
    if (!_isLoading &&
        _scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isLoading = true;
      });
      context.read<DepartmentBloc>().add(
            _departmentGetList.copyWith(
              currentPage: (_departmentGetItem!.currentPage + 1).toString(),
            ),
          );
    }
  }

  void _onTextChanged(String value) {
    if (value == _previousText) return;
    _previousText = value;
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 1000),
      () {
        context.read<DepartmentBloc>().add(
              _departmentGetList.copyWith(
                filters: 'name@=${value.toString()}',
              ),
            );
        setState(() {
          _isSearch = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = SliverToBoxAdapter(
      child: DepartmentChooseListItem(
        listChooseDepartmentItem: _departmentGetItem?.rows ?? [],
        isLoading: _isLoading && !_isSearch,
        isFirstLoading:
            _departmentGetItem == null || _departmentGetItem?.rows == null,
        onClick: widget.onDepartmentSelected,
      ),
    );

    if (_departmentGetItem != null &&
        (_departmentGetItem?.rows == null ||
            _departmentGetItem!.rows.isEmpty)) {
      content = const SliverToBoxAdapter(
          child: CustomNoData(
        text: 'Chuyên khoa không tồn tại.',
      ));
    }

    if (_isSearch) {
      LoadingOverlay.showLoading(context);
    } else {
      LoadingOverlay.dismissLoading();
    }

    return BlocConsumer<DepartmentBloc, DepartmentState>(
      listener: (context, state) {
        if (state is DepartmentFailure) {
          ShowSnackBar.error(state.message, context);
        }

        if (state is DepartmentSuccess) {
          if (state.onDepartmentEvent ==
              OnDepartmentEvent.onDepartmentGetList) {
            setState(() {
              if (_isSearch) {
                _isSearch = false;
              }

              if (state.departmentGetItem?.currentPage == 1) {
                _departmentGetItem = state.departmentGetItem;
              } else {
                _departmentGetItem = _departmentGetItem?.copyWithAddRow(
                  count: state.departmentGetItem?.count,
                  rows: state.departmentGetItem?.rows,
                  totalPages: state.departmentGetItem?.totalPages,
                  currentPage: state.departmentGetItem?.currentPage,
                );
              }
              _isLoading = false;
            });
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const CustomAppBar(
            title: 'Chọn chuyên Khoa',
          ),
          body: SafeArea(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  pinned: true,
                  snap: true,
                  stretch: true,
                  floating: true,
                  automaticallyImplyLeading: false,
                  expandedHeight: 68.0,
                  flexibleSpace: CustomSearchBar(
                    controller: _searchController,
                    borderColor: Theme.of(context).colorScheme.tertiary,
                    onChanged: (text) {
                      _onTextChanged(text.toString());
                    },
                    onClear: () {
                      setState(() {
                        _isSearch = true;
                      });
                      context.read<DepartmentBloc>().add(_departmentGetList);
                    },
                  ),
                ),
                content,
              ],
            ),
          ),
        );
      },
    );
  }
}
