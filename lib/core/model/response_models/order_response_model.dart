import '../../enum/status_response.dart';
import '../../items/items.dart';
import 'base_response_model.dart';

class OrderResponseModel extends BaseReponseModel<List<OrderItem>> {
  OrderResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderResponseModel(
        message: json["message"] ?? '',
        responseData: List<OrderItem>.from(
          json['responseData'].map(
            (item) => OrderItem.fromJson(item),
          ),
        ),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
