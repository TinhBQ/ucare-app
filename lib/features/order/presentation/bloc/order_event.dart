// ignore_for_file: non_constant_identifier_names

part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

final class OrderPayment extends OrderEvent {
  final List<OrderPaymentRequestItem> orderPaymentRequestItems;

  const OrderPayment({
    required this.orderPaymentRequestItems,
  });

  OrderPayment copyWith({
    List<OrderPaymentRequestItem>? orderPaymentRequestItems,
  }) {
    return OrderPayment(
      orderPaymentRequestItems:
          orderPaymentRequestItems ?? this.orderPaymentRequestItems,
    );
  }
}

final class OrderExcute extends OrderEvent {
  final List<OrderRequestItem> orderRequestItems;

  const OrderExcute({
    required this.orderRequestItems,
  });

  OrderExcute copyWith({
    List<OrderRequestItem>? orderRequestItems,
  }) {
    return OrderExcute(
      orderRequestItems: orderRequestItems ?? this.orderRequestItems,
    );
  }
}

final class OrderPaymentReturnURL extends OrderEvent {
  final String order_id;
  final int amount;
  final String info;
  final String returnUrl;

  const OrderPaymentReturnURL({
    required this.order_id,
    required this.amount,
    required this.info,
    required this.returnUrl,
  });
}
