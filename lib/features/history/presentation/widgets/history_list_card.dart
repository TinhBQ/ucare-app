import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/configs/routes/names/names.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_choose_exam_info/app_choose_exam_info_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/history/presentation/widgets/history_item.dart';

class HistoryListCardWidget extends StatelessWidget {
  final List<PatientScheduleItem> patientSchedules;
  final Function(String) onCancel;
  const HistoryListCardWidget({
    super.key,
    required this.patientSchedules,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: patientSchedules.length,
      itemBuilder: (context, index) {
        return HistoryItemWidget(
          doctorName: patientSchedules[index].schedule.doctor.name,
          degree: patientSchedules[index].schedule.doctor.degree?.name,
          roomName: patientSchedules[index].schedule.room.name,
          sessionName: patientSchedules[index].schedule.session.content,
          departmentName: patientSchedules[index].schedule.department.name,
          day: patientSchedules[index].schedule.day,
          firstName: patientSchedules[index].patient.first_name,
          lastName: patientSchedules[index].patient.last_name,
          code: patientSchedules[index].status.code ?? "",
          onRest: () {
            context.read<AppChooseExamInfoCubit>().updateValue(
                  0,
                  value: patientSchedules[index].schedule.department.name,
                  id: patientSchedules[index].schedule.department.id,
                  price: patientSchedules[index]
                      .schedule
                      .department
                      .service_charge,
                  numFlow: 0,
                );

            Navigator.of(context)
                .pushReplacementNamed(AppRoutes.BOOK_BY_SPECIALTY);
            ShowSnackBar.success("Chọn hồ sơ khám", context);
          },
          onCancel: () {
            onCancel(patientSchedules[index].patient_schedule_id);
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 0,
        );
      },
    );
  }
}
