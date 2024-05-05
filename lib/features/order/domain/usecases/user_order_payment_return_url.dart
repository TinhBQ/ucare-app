import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/order_repository.dart';

class UserOrderPaymentReturnURL
    implements UseCase<String, OrderPaymentReturnURLRequestModel> {
  final OrderRepository orderRepository;
  UserOrderPaymentReturnURL(this.orderRepository);

  @override
  Future<Either<Failure, String>> call(
      OrderPaymentReturnURLRequestModel body) async {
    return await orderRepository.onOrderPaymentReturnURL(body);
  }
}
