// ignore_for_file: non_constant_identifier_names

part of "order_request_model_dependencies.dart";

class OrderRequestItem {
  final String? id;
  final String payment_id;
  final String patient_id;
  final List<String> schedule;
  final String sum;

  OrderRequestItem({
    this.id,
    required this.payment_id,
    required this.patient_id,
    required this.schedule,
    required this.sum,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_id": payment_id,
        "patient_id": patient_id,
        "schedule": schedule,
        "sum": sum,
      };

  Map<String, dynamic> toJsonLocal() => {
        "id": id,
        "payment_id": payment_id,
        "patient_id": patient_id,
        "schedule": schedule[0].toString(),
        "sum": sum,
      };

  factory OrderRequestItem.fromJson(Map<String, dynamic> json) {
    return OrderRequestItem(
      id: json['id'],
      payment_id: json['payment_id'],
      patient_id: json['patient_id'],
      schedule: [
        json['schedule'],
      ],
      sum: json['sum'],
    );
  }

  static List<OrderRequestItem> orderRequestItemsFromJson(
      List<Map<String, dynamic>> jsons) {
    return jsons.map((json) => OrderRequestItem.fromJson(json)).toList();
  }

  OrderRequestItem copyWith({
    String? id,
    String? payment_id,
    String? patient_id,
    List<String>? schedule,
    String? sum,
  }) {
    return OrderRequestItem(
      id: id ?? this.id,
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
