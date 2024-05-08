import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_patient_schedule/app_patient_schedule_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_status/app_status_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/base_get_request_model.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/bloc/patient_schedule_bloc.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/widgets/history_list_card.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/widgets/multi_optional.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/features/status/presentation/bloc/status_bloc.dart';

class HistoryBookPage extends StatefulWidget {
  const HistoryBookPage({super.key});

  @override
  State<StatefulWidget> createState() => _HistoryBookPageState();
}

class _HistoryBookPageState extends State<HistoryBookPage> {
  int _currentStep = 0;

  bool _isLoading = false;
  PatientScheduleGetItem? _patientScheduleGetItem;
  BaseGetRequestModel? _baseGetRequestModel;
  final ScrollController _scrollController = ScrollController();

  List<StatusItem> statusItems = [];

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    statusItems = context
        .read<AppStatusCubit>()
        .state
        .statusGetItem!
        .rows
        .where((item) => item.group == 'SCHEDULE')
        .toList();
    _loadData();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    _patientScheduleGetItem =
        context.read<AppPatientScheduleCubit>().state.patientScheduleGetItem;

    if (_patientScheduleGetItem?.totalPages.toString() ==
        _patientScheduleGetItem?.currentPage.toString()) {
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
          .read<AppPatientScheduleCubit>()
          .nextPage((_patientScheduleGetItem!.currentPage + 1).toString());
      _loadData();
    }
  }

  void _loadData() {
    _baseGetRequestModel =
        context.read<AppPatientScheduleCubit>().state.baseGetRequestModel;

    context.read<PatientScheduleBloc>().add(
          PatientScheduleGetList(
            currentPage: _baseGetRequestModel!.currentPage,
            pageSize: _baseGetRequestModel!.pageSize,
            filters: _baseGetRequestModel!.filters,
            sortField: _baseGetRequestModel!.sortField,
            sortOrder: _baseGetRequestModel!.sortOrder,
          ),
        );
  }

  void _onChangeStatus(String statusId) {
    context.read<AppPatientScheduleCubit>().onChangeStatus(statusId);
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    PatientScheduleGetItem? patientScheduleGetItem = context.select(
        (AppPatientScheduleCubit cubit) => cubit.state.patientScheduleGetItem);

    return MultiBlocListener(
      listeners: [
        BlocListener<PatientScheduleBloc, PatientScheduleState>(
          listener: (context, state) {
            if (state is PatientScheduleLoading) {
              LoadingOverlay.showLoading(context);
            } else if (state is PatientScheduleFailure) {
              LoadingOverlay.dismissLoading();
              // ShowSnackBar.error(state.message, context);
            } else if (state is PatientScheduleSuccess) {
              LoadingOverlay.dismissLoading();
              // ShowSnackBar.success(state.message, context);
            }
          },
        ),
        BlocListener<StatusBloc, StatusState>(
          listener: (context, state) {},
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Phiếu khám bệnh',
          background: Theme.of(context).colorScheme.tertiary,
          color: Colors.white,
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: MultiOptionalWidget(
                currentStep: _currentStep,
                onStepSelected: (int step, String statusId) {
                  setState(() {
                    _currentStep = step;
                  });
                  _onChangeStatus(statusId);
                },
                statusItems: statusItems,
              ),
            ),
            HistoryListCardWidget(
              patientSchedules: patientScheduleGetItem?.rows ?? [],
            ),
          ],
        ),
      ),
    );
  }
}
