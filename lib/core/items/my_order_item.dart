// ignore_for_file: non_constant_identifier_names

part of './item_dependencies.dart';

class MyOrderItem {
  final String? id;
  final String? code;
  final List<String>? schedule;
  final String? description;
  final String? add_info;
  final PaymentItem? payment;

  MyOrderItem({
    this.id,
    this.code,
    this.schedule,
    this.description,
    this.add_info,
    this.payment,
  });

  factory MyOrderItem.fromJson(Map<String, dynamic> json) {
    return MyOrderItem(
      id: json['id'],
      code: json['code'],
      schedule: List<String>.from(
        json['schedule'].map(
          (item) => item.toString(),
        ),
      ),
      description: json['description'],
      add_info: json['add_info'],
      payment: PaymentItem.fromJson(json['payment']),
    );
  }
}
