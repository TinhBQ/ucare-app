part of 'api_dependencies.dart';

class OrderApi {
  static onOrder(OrderRequestModel body) async {
    try {
      var response = await HttpUtil().post(
        AppConstants.SERVER_ORDER,
        mydata: body.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return OrderResponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_FAIL);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_FAIL);
    }
  }

  static onOrderPayment(OrderPaymentRequestModel body) async {
    try {
      var response = await HttpUtil().post(
        AppConstants.SERVER_ORDER_PAYMENT,
        mydata: body.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return OrderPaymentResponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_FAIL);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_FAIL);
    }
  }

  static onOrderPaymentReturnURL(OrderPaymentReturnURLRequestModel body) async {
    try {
      var response = await HttpUtil().post(
        AppConstants.SERVER_ORDER_PAYMENT_RETURN_URL,
        mydata: body.toJson(),
      );

      if (response.statusCode == HttpStatusCode.OK) {
        return OrderPaymentReturnURLResponseModel.fromJson(response.data);
      } else {
        throw ServerException(ServerException.GET_FAIL);
      }
    } catch (e) {
      throw ServerException(ServerException.GET_FAIL);
    }
  }
}
