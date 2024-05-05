import '../../enum/status_response.dart';
import 'base_response_model.dart';

class OrderPaymentReturnURLResponseModel extends BaseReponseModel<String> {
  OrderPaymentReturnURLResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory OrderPaymentReturnURLResponseModel.fromJson(
          Map<String, dynamic> json) =>
      OrderPaymentReturnURLResponseModel(
        message: json["message"] ?? '',
        responseData: json["responseData"] ?? '',
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
