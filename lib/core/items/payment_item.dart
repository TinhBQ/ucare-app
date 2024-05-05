// ignore_for_file: non_constant_identifier_names
import 'package:mobile_advanced_project_fe/core/entities/entities.dart';

class PaymentItem extends PaymentEntity {
  PaymentItem({
    required super.id,
    required super.status_id,
    required super.type,
    super.add_info,
  });

  factory PaymentItem.fromJson(Map<String, dynamic> json) {
    return PaymentItem(
      id: json['id'] ?? '',
      status_id: json['status_id'] ?? '',
      type: json['type'] ?? '',
      add_info: json['add_info'] ?? '',
    );
  }
}
