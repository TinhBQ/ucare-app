import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_doctor/app_doctor_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/doctor/presentation/bloc/doctor_bloc.dart';
import 'package:pinput/pinput.dart';

import '../widgets/widget.dart';

class DoctorFindExamTimesPage extends StatefulWidget {
  const DoctorFindExamTimesPage({super.key});

  @override
  State<DoctorFindExamTimesPage> createState() =>
      _DoctorFindExamTimesPageState();
}

class _DoctorFindExamTimesPageState extends State<DoctorFindExamTimesPage> {
  final ScrollController _scrollController = ScrollController();
  final _searchController = TextEditingController();
  Timer? _debounce;
  String _previousText = '';
  bool _isLoading = false;
  DoctorGetItem? _doctorGetItem;
  DoctorGetRequestModel? _doctorGetRequestModel;

  @override
  void initState() {
    _searchController.setText(
        context.read<AppDoctorCubit>().state.doctorGetRequestModel.full_name ??
            '');
    _scrollController.addListener(_scrollListener);
    super.initState();
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
    _doctorGetItem = context.read<AppDoctorCubit>().state.doctorGetItem;
    if (_doctorGetItem?.totalPages.toString() ==
        _doctorGetItem?.currentPage.toString()) {
      return;
    }
    if (!_isLoading &&
        _scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isLoading = true;
      });
      context
          .read<AppDoctorCubit>()
          .nextPage((_doctorGetItem!.currentPage + 1).toString());
      _loadData();
    }
  }

  void _onTextChanged(String value) {
    if (value == _previousText) return;
    _previousText = value;
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 1000),
      () {
        context.read<AppDoctorCubit>().updateDoctorSearchName(value);
        _loadData();
      },
    );
  }

  void _loadData() {
    _doctorGetRequestModel =
        context.read<AppDoctorCubit>().state.doctorGetRequestModel;
    context.read<DoctorBloc>().add(
          DoctorFindExamTimes(
            currentPage: _doctorGetRequestModel!.currentPage,
            pageSize: _doctorGetRequestModel!.pageSize,
            filters: _doctorGetRequestModel!.filters,
            sortField: _doctorGetRequestModel!.sortField,
            sortOrder: _doctorGetRequestModel!.sortOrder,
            full_name: _doctorGetRequestModel!.full_name,
            session_of_day: _doctorGetRequestModel!.session_of_day,
          ),
        );
  }

  void _resetSearch() {
    context.read<AppDoctorCubit>().updateDoctorSearchName('');
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    DoctorGetItem? doctorGetItem =
        context.select((AppDoctorCubit cubit) => cubit.state.doctorGetItem);

    DocterFilerItem? docterFilerItem =
        context.select((AppDoctorCubit cubit) => cubit.state.docterFilerItem);

    Widget content = SliverToBoxAdapter(
      child: DoctorListItemWidget(
        listDoctorItem: doctorGetItem?.rows ?? [],
        isFirstLoading: doctorGetItem == null,
        isLoading: _isLoading,
      ),
    );

    if (doctorGetItem != null && doctorGetItem.rows.isEmpty) {
      content = const SliverToBoxAdapter(
          child: CustomNoData(
        text: 'Không có lịch khám bệnh',
      ));
    }

    return BlocConsumer<DoctorBloc, DoctorState>(
      listener: (context, state) {
        if (state is DoctorLoading) {
          if (_isLoading == false) {
            LoadingOverlay.showLoading(context);
          }
        }

        if (state is DoctorFailure) {
          if (_isLoading == false) {
            LoadingOverlay.dismissLoading();
          } else {
            setState(() {
              _isLoading = false;
            });
          }
        }

        if (state is DoctorSuccess) {
          if (_isLoading == false) {
            LoadingOverlay.dismissLoading();
          } else {
            setState(() {
              _isLoading = false;
            });
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const CustomAppBar(
            title: 'Lịch khám bệnh',
          ),
          body: SafeArea(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  toolbarHeight: 142,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  pinned: true,
                  snap: true,
                  stretch: true,
                  floating: true,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Column(
                    children: [
                      DoctorFindExamTimesFilter(
                        departmentName:
                            docterFilerItem?.departmentFilterItem?.name,
                        sessionOfDayName:
                            docterFilerItem?.sessionOfDayFilterItem?.content,
                      ),
                      CustomSearchBar(
                        controller: _searchController,
                        borderColor: Theme.of(context).colorScheme.tertiary,
                        onChanged: (text) {
                          _onTextChanged(text.toString());
                        },
                        onClear: () {
                          _resetSearch();
                        },
                      ),
                    ],
                  ),
                ),
                content
              ],
            ),
          ),
        );
      },
    );
  }
}
