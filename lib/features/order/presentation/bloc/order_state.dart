part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderSuccess extends OrderState {
  final String message;
  final OnOrderEvent onOrderEvent;
  final List<PaymentItem>? paymentItems;
  final List<OrderItem>? orderItems;
  final String? link;

  const OrderSuccess(
    this.message,
    this.onOrderEvent, {
    this.paymentItems,
    this.orderItems,
    this.link,
  });
}

final class OrderFailure extends OrderState {
  final String message;
  final OnOrderEvent onOrderEvent;
  const OrderFailure(this.message, this.onOrderEvent);
}
