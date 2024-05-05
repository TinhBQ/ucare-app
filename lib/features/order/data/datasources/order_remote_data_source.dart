import 'package:mobile_advanced_project_fe/core/api/api_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/enum/enum_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/response_models.dart';

import '../../../../core/items/item_dependencies.dart';

abstract interface class OrderRemoteDataSource {
  Future<List<PaymentItem>?> onOrderPayment(OrderPaymentRequestModel body);

  Future<List<OrderItem>?> onOrder(OrderRequestModel body);

  Future<String?> onOrderPaymentReturnURL(
      OrderPaymentReturnURLRequestModel body);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  OrderRemoteDataSourceImpl();

  @override
  Future<List<PaymentItem>?> onOrderPayment(
      OrderPaymentRequestModel body) async {
    OrderPaymentResponseModel response = await OrderApi.onOrderPayment(body);

    return response.status == StatusResponse.success.name
        ? response.responseData
        : throw ServerException(ServerException.GET_FAIL);
  }

  @override
  Future<List<OrderItem>?> onOrder(OrderRequestModel body) async {
    OrderResponseModel response = await OrderApi.onOrder(body);

    return response.status == StatusResponse.success.name
        ? response.responseData
        : throw ServerException(ServerException.GET_FAIL);
  }

  @override
  Future<String?> onOrderPaymentReturnURL(
      OrderPaymentReturnURLRequestModel body) async {
    OrderPaymentReturnURLResponseModel response =
        await OrderApi.onOrderPaymentReturnURL(body);
    return response.status == StatusResponse.success.name
        ? response.responseData
        : throw ServerException(ServerException.GET_FAIL);
  }
}
