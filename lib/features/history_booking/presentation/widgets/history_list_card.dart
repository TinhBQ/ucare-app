import 'package:flutter/widgets.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/widgets/history_item.dart';

class HistoryListCardWidget extends StatelessWidget {
  final List<PatientScheduleItem> patientSchedules;
  const HistoryListCardWidget({
    super.key,
    required this.patientSchedules,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: patientSchedules.length,
        itemBuilder: (context, index) {
          return HistoryItemWidget(
            doctorName: patientSchedules[index].schedule.doctor.name,
            degree: patientSchedules[index].schedule.doctor.degree?.name,
            roomName: patientSchedules[index].schedule.room.name,
            sessionName: patientSchedules[index].schedule.session.content,
            departmentName:
                patientSchedules[index].schedule.doctor.department?.name,
            day: patientSchedules[index].schedule.day,
            firstName: patientSchedules[index].patient.first_name,
            lastName: patientSchedules[index].patient.last_name,
          );
        },
      ),
    );
  }
}
