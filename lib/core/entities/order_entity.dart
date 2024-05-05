// ignore_for_file: non_constant_identifier_names

class OrderEntity {
  final String id;
  final String payment_id;
  final String patient_id;
  final List<String>? schedule;
  final String? sum;
  final String? code;
  final String? user_id;
  final String? description;
  final String? add_info;

  OrderEntity({
    required this.id,
    required this.payment_id,
    required this.patient_id,
    this.schedule,
    this.sum,
    this.code,
    this.user_id,
    this.description,
    this.add_info,
  });
}
