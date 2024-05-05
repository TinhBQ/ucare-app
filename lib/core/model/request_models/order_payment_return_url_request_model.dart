// ignore_for_file: non_constant_identifier_names

class OrderPaymentReturnURLRequestModel {
  final String order_id;
  final int amount;
  final String info;
  final String returnUrl;

  OrderPaymentReturnURLRequestModel({
    required this.order_id,
    required this.amount,
    required this.info,
    required this.returnUrl,
  });

  Map<String, dynamic> toJson() => {
        "order_id": order_id,
        "amount": amount,
        "info": info,
        "returnUrl": returnUrl,
      };

  OrderPaymentReturnURLRequestModel copyWith({
    String? order_id,
    int? amount,
    String? info,
    String? returnUrl,
  }) {
    return OrderPaymentReturnURLRequestModel(
      order_id: order_id ?? this.order_id,
      amount: amount ?? this.amount,
      info: info ?? this.info,
      returnUrl: returnUrl ?? this.returnUrl,
    );
  }
}
