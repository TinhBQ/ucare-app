// ignore_for_file: non_constant_identifier_names

part of "order_request_model_dependencies.dart";

class OrderRequestItem {
  final String payment_id;
  final String patient_id;
  final List<String> schedule;
  final String sum;

  OrderRequestItem({
    required this.payment_id,
    required this.patient_id,
    required this.schedule,
    required this.sum,
  });

  Map<String, dynamic> toJson() => {
        "payment_id": payment_id,
        "patient_id": patient_id,
        "schedule": schedule,
        "sum": sum,
      };

  OrderRequestItem copyWith({
    String? payment_id,
    String? patient_id,
    List<String>? schedule,
    String? sum,
  }) {
    return OrderRequestItem(
      payment_id: payment_id ?? this.payment_id,
      patient_id: patient_id ?? this.patient_id,
      schedule: schedule ?? this.schedule,
      sum: sum ?? this.sum,
    );
  }
}

class OrderRequestModel {
  final List<OrderRequestItem> orderRequestItems;

  OrderRequestModel({
    required this.orderRequestItems,
  });

  List<Map<String, dynamic>> toJson() =>
      orderRequestItems.map((item) => item.toJson()).toList();

  OrderRequestModel copyWith({
    List<OrderRequestItem>? orderRequestItems,
  }) {
    return OrderRequestModel(
      orderRequestItems: orderRequestItems ?? this.orderRequestItems,
    );
  }
}
