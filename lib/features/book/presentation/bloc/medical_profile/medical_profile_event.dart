// ignore_for_file: non_constant_identifier_names

part of 'medical_profile_bloc.dart';

sealed class MedicalProfileEvent extends Equatable {
  const MedicalProfileEvent();

  @override
  List<Object> get props => [];
}

final class MedicalProfileCreate extends MedicalProfileEvent {
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
  const MedicalProfileCreate({
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
