import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';

import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import '../bloc/session_of_day_bloc.dart';
import '../widgets/widget.dart';

class SessionOfDayChooseItemPage extends StatefulWidget {
  final Function(SessionOfDayItem) onSessionOfDaySelected;

  const SessionOfDayChooseItemPage(
      {super.key, required this.onSessionOfDaySelected});

  @override
  State<SessionOfDayChooseItemPage> createState() =>
      _SessionOfDayChooseItemPageState();
}

class _SessionOfDayChooseItemPageState
    extends State<SessionOfDayChooseItemPage> {
  final _searchController = TextEditingController();
  final SessionOfDayGetList _sessionOfDayGetList = const SessionOfDayGetList();

  final ScrollController _scrollController = ScrollController();

  SessionOfDayGetItem? _sessionOfDayGetItem;
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
    context.read<SessionOfDayBloc>().add(_sessionOfDayGetList);
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
    if (_sessionOfDayGetItem?.totalPages.toString() ==
        _sessionOfDayGetItem?.currentPage.toString()) {
      return;
    }
    if (!_isLoading &&
        _scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isLoading = true;
      });
      context.read<SessionOfDayBloc>().add(
            _sessionOfDayGetList.copyWith(
              currentPage: (_sessionOfDayGetItem!.currentPage + 1).toString(),
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
        context.read<SessionOfDayBloc>().add(
              _sessionOfDayGetList.copyWith(
                filters: 'content@=${value.toString()}',
              ),
            );
        setState(() {
          _isSearch = true;
        });
      },
    );
  }

  // void _chooseSessionOfDayItem(
  //   SessionOfDayItem item,
  // ) {
  //   context.read<AppDoctorCubit>().updateSessionOfDayFilterItem(item);
  //   DoctorGetRequestModel doctorGetRequestModel =
  //       context.read<AppDoctorCubit>().state.doctorGetRequestModel;
  //   context.read<DoctorBloc>().add(
  //         DoctorFindExamTimes(
  //           currentPage: doctorGetRequestModel.currentPage,
  //           pageSize: doctorGetRequestModel.pageSize,
  //           filters: doctorGetRequestModel.filters,
  //           sortField: doctorGetRequestModel.sortField,
  //           sortOrder: doctorGetRequestModel.sortOrder,
  //           full_name: doctorGetRequestModel.full_name,
  //           session_of_day: doctorGetRequestModel.session_of_day,
  //         ),
  //       );
  //   Navigator.of(context).pop();
  // }

  @override
  Widget build(BuildContext context) {
    Widget content = SliverToBoxAdapter(
      child: ChooseSessionOfDayListItemWidget(
        listSessionOfDayItem: _sessionOfDayGetItem?.rows ?? [],
        isLoading: _isLoading && !_isSearch,
        isFirstLoading:
            _sessionOfDayGetItem == null || _sessionOfDayGetItem?.rows == null,
        onClick: widget.onSessionOfDaySelected,
      ),
    );

    if (_sessionOfDayGetItem != null &&
        (_sessionOfDayGetItem?.rows == null ||
            _sessionOfDayGetItem!.rows.isEmpty)) {
      content = const SliverToBoxAdapter(
          child: CustomNoData(
        text: 'Ngày khám không tồn tại.',
      ));
    }

    if (_isSearch) {
      LoadingOverlay.showLoading(context);
    } else {
      LoadingOverlay.dismissLoading();
    }

    return BlocConsumer<SessionOfDayBloc, SessionOfDayState>(
      listener: (context, state) {
        if (state is SessionOfDayFailure) {
          ShowSnackBar.error(state.message, context);
        }

        if (state is SessionOfDaySuccess) {
          if (state.onSessionOfDayEvent ==
              OnSessionOfDayEvent.onSessionOfDayGetList) {
            setState(() {
              if (_isSearch) {
                _isSearch = false;
              }

              if (state.sessionOfDayGetItem?.currentPage == 1) {
                _sessionOfDayGetItem = state.sessionOfDayGetItem;
              } else {
                _sessionOfDayGetItem = _sessionOfDayGetItem?.copyWithAddRow(
                  count: state.sessionOfDayGetItem?.count,
                  rows: state.sessionOfDayGetItem?.rows,
                  totalPages: state.sessionOfDayGetItem?.totalPages,
                  currentPage: state.sessionOfDayGetItem?.currentPage,
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
            title: 'Chọn ngày khám',
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
                      context
                          .read<SessionOfDayBloc>()
                          .add(_sessionOfDayGetList);
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
