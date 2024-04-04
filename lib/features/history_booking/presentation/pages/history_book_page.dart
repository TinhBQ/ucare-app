import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_patient_schedule/app_patient_schedule_cubit.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/core/items/patient_schedule_get_item.dart';
import 'package:mobile_advanced_project_fe/core/utils/loading_overlay.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/bloc/patient_schedule_bloc.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/widgets/history_list_card.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/widgets/multi_optional.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/widgets/widgets.dart';

class HistoryBookPage extends StatefulWidget {
  const HistoryBookPage({super.key});

  @override
  State<StatefulWidget> createState() => _HistoryBookPageState();
}

class _HistoryBookPageState extends State<HistoryBookPage> {
  int _currentStep = 0;
  List<String> listTitleSteps = [
    'Đã thanh toán',
    'Đã tiếp nhận',
    'Đã khám',
    'Đã hủy'
  ];

  @override
  void initState() {
    context.read<PatientScheduleBloc>().add(const PatientScheduleGetList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PatientScheduleGetItem? patientScheduleGetItem = context.select(
        (AppPatientScheduleCubit cubit) => cubit.state.patientScheduleGetItem);
    return BlocConsumer<PatientScheduleBloc, PatientScheduleState>(
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
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: 'Phiếu khám bệnh',
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MultiOptionalWidget(
                currentStep: _currentStep,
                onStepSelected: (int step) {
                  setState(() {
                    _currentStep = step;
                  });
                },
              ),
              const SizedBox(height: 20),
              HistoryListCardWidget(
                patientSchedules: patientScheduleGetItem?.rows ?? [],
              ),
            ],
          ),
        );
      },
    );
  }
}
