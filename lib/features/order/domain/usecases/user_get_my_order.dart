import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/order_repository.dart';

class UserGetMyOrder implements UseCase<MyOrderGetItem, BaseGetRequestModel> {
  final OrderRepository orderRepository;
  UserGetMyOrder(this.orderRepository);

  @override
  Future<Either<Failure, MyOrderGetItem>> call(
      BaseGetRequestModel params) async {
    return await orderRepository.getMyOrder(params);
  }
}
