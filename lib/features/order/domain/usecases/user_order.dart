import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/order_repository.dart';

class UserOrder implements UseCase<List<OrderItem>, OrderRequestModel> {
  final OrderRepository orderRepository;
  UserOrder(this.orderRepository);

  @override
  Future<Either<Failure, List<OrderItem>>> call(OrderRequestModel body) async {
    return await orderRepository.onOrder(body);
  }
}
