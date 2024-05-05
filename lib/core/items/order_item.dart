// ignore_for_file: non_constant_identifier_names
import 'package:mobile_advanced_project_fe/core/entities/entities.dart';

class OrderItem extends OrderEntity {
  OrderItem({
    required super.id,
    required super.payment_id,
    required super.patient_id,
    super.schedule,
    super.sum,
    super.code,
    super.user_id,
    super.description,
    super.add_info,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] ?? '',
      payment_id: json['payment_id'] ?? '',
      patient_id: json['patient_id'] ?? '',
      schedule: List<String>.from(
        json['schedule'].map(
          (item) => item.toString(),
        ),
      ),
      sum: json['sum'] ?? '',
      code: json['code'] ?? '',
      user_id: json['user_id'] ?? '',
      description: json['description'] ?? '',
      add_info: json['add_info'] ?? '',
    );
  }
}
