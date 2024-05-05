import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/repository/order_repository.dart';
import '../datasources/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource orderRemoteDataSource;

  OrderRepositoryImpl(this.orderRemoteDataSource);

  @override
  Future<Either<Failure, List<PaymentItem>>> onOrderPayment(
      OrderPaymentRequestModel body) async {
    try {
      final orderPaymentGetItem =
          await orderRemoteDataSource.onOrderPayment(body);
      return right(orderPaymentGetItem!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<OrderItem>>> onOrder(
      OrderRequestModel body) async {
    try {
      final orderItems = await orderRemoteDataSource.onOrder(body);
      return right(orderItems!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> onOrderPaymentReturnURL(
      OrderPaymentReturnURLRequestModel body) async {
    try {
      final orderPaymentReturnURLItem =
          await orderRemoteDataSource.onOrderPaymentReturnURL(body);
      return right(orderPaymentReturnURLItem!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
