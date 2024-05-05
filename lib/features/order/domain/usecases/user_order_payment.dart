import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/order_repository.dart';

class UserOrderPayment
    implements UseCase<List<PaymentItem>, OrderPaymentRequestModel> {
  final OrderRepository orderRepository;
  UserOrderPayment(this.orderRepository);

  @override
  Future<Either<Failure, List<PaymentItem>>> call(
      OrderPaymentRequestModel body) async {
    return await orderRepository.onOrderPayment(body);
  }
}
