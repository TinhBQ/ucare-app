// ignore_for_file: non_constant_identifier_names

class PaymentEntity {
  final String id;
  final String status_id;
  final String type;
  final String? add_info;

  PaymentEntity({
    required this.id,
    required this.status_id,
    required this.type,
    this.add_info,
  });
}
