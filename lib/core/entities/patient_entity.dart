// ignore_for_file: non_constant_identifier_names

class PatientEntity {
  final String id;
  final String user_id;
  final String first_name;
  final String last_name;
  final String phone;
  final String email;
  final String citizen_id;
  final String birthday;
  final bool male;
  final String nation;
  final String ethnicity;
  final String job;
  final String province;
  final String district;
  final String wards;
  final String address;

  PatientEntity({
    required this.id,
    required this.user_id,
    required this.first_name,
    required this.last_name,
    required this.phone,
    required this.email,
    required this.citizen_id,
    required this.birthday,
    required this.male,
    required this.nation,
    required this.ethnicity,
    required this.job,
    required this.province,
    required this.district,
    required this.wards,
    required this.address,
  });
}
