// ignore_for_file: non_constant_identifier_names

part of 'patient_bloc.dart';

sealed class PatientEvent extends Equatable {
  const PatientEvent();

  @override
  List<Object> get props => [];
}

final class PatientGetList extends PatientEvent {
  final String? currentPage;
  final String? pageSize;
  final String? filters;
  final String? sortField;
  final String? sortOrder;

  const PatientGetList({
    this.currentPage = '1',
    this.pageSize = '5',
    this.filters,
    this.sortField,
    this.sortOrder,
  });

  PatientGetList copyWith({
    String? currentPage,
    String? pageSize,
    String? filters,
    String? sortField,
    String? sortOrder,
  }) {
    return PatientGetList(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      filters: filters ?? this.filters,
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}

final class PatientCreateProfile extends PatientEvent {
  final String first_name;
  final String last_name;
  final String phone;
  final String email;
  final String citizen_id;
  final String birthday;
  final bool male;
  final String nation;
  final String? ethnicity;
  final String job;
  final String? province;
  final String? district;
  final String? wards;
  final String? address;

  const PatientCreateProfile({
    required this.first_name,
    required this.last_name,
    required this.phone,
    required this.email,
    required this.citizen_id,
    required this.birthday,
    required this.male,
    required this.nation,
    required this.job,
    this.ethnicity,
    this.province,
    this.district,
    this.wards,
    this.address,
  });
}

final class PatientBookSchedule extends PatientEvent {
  final String schedule_id;
  final String patient_id;

  const PatientBookSchedule({
    required this.schedule_id,
    required this.patient_id,
  });
}

final class PatientDeleteProfile extends PatientEvent {
  final String patient_id;
  const PatientDeleteProfile({
    required this.patient_id,
  });
}
