// ignore_for_file: non_constant_identifier_names

class CreatePatientRequestModel {
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
  CreatePatientRequestModel({
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

  Map<String, dynamic> toJson() => {
        "first_name": first_name,
        "last_name": last_name,
        "phone": phone,
        "email": email,
        "citizen_id": citizen_id,
        "birthday": birthday,
        "male": male,
        "nation": nation,
        "ethnicity": ethnicity,
        "job": job,
        "province": province,
        "district": district,
        "wards": wards,
        "address": address,
      };
}
