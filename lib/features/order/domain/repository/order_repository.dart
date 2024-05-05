import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

abstract interface class OrderRepository {
  Future<Either<Failure, List<PaymentItem>>> onOrderPayment(
      OrderPaymentRequestModel body);

  Future<Either<Failure, List<OrderItem>>> onOrder(OrderRequestModel body);

  Future<Either<Failure, String>> onOrderPaymentReturnURL(
      OrderPaymentReturnURLRequestModel body);
}
