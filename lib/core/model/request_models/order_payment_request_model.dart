// ignore_for_file: non_constant_identifier_names

class OrderPaymentRequestItem {
  final String type;
  final String status_id;

  OrderPaymentRequestItem({
    required this.type,
    required this.status_id,
  });

  Map<String, dynamic> toJson() => {
        "type": type,
        "status_id": status_id,
      };

  OrderPaymentRequestItem copyWith({
    String? type,
    String? status_id,
  }) {
    return OrderPaymentRequestItem(
      type: type ?? this.type,
      status_id: status_id ?? this.status_id,
    );
  }
}

class OrderPaymentRequestModel {
  final List<OrderPaymentRequestItem> orderPaymentRequestItems;

  OrderPaymentRequestModel({
    required this.orderPaymentRequestItems,
  });

  List<Map<String, dynamic>> toJson() =>
      orderPaymentRequestItems.map((item) => item.toJson()).toList();

  OrderPaymentRequestModel copyWith({
    List<OrderPaymentRequestItem>? orderPaymentRequestItems,
  }) {
    return OrderPaymentRequestModel(
      orderPaymentRequestItems:
          orderPaymentRequestItems ?? this.orderPaymentRequestItems,
    );
  }
}
