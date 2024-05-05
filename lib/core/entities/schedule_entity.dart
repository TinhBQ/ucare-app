// ignore_for_file: non_constant_identifier_names

part of 'entity_dependencies.dart';


class ScheduleEntity {
  final String schedule_id;
  final DoctorEntity doctor;
  final RoomEntity room;
  final DepartmentEntity department;
  final SessionOfDayEntity session;
  final String day;

  ScheduleEntity({
    required this.schedule_id,
    required this.doctor,
    required this.room,
    required this.department,
    required this.session,
    required this.day,
  });
}
