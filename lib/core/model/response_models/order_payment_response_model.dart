import '../../enum/status_response.dart';
import '../../items/items.dart';
import 'base_response_model.dart';

class OrderPaymentResponseModel extends BaseReponseModel<List<PaymentItem>> {
  OrderPaymentResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory OrderPaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderPaymentResponseModel(
        message: json["message"] ?? '',
        responseData: List<PaymentItem>.from(
          json['responseData'].map(
            (item) => PaymentItem.fromJson(item),
          ),
        ),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
