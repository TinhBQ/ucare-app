part of 'response_models.dart';

class StatisticMonthToMonthResponseModel
    extends BaseReponseModel<List<MonthToMonthItem>> {
  StatisticMonthToMonthResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory StatisticMonthToMonthResponseModel.fromJson(
          Map<String, dynamic> json) =>
      StatisticMonthToMonthResponseModel(
        message: json["message"] ?? '',
        responseData: List<MonthToMonthItem>.from(
          json['responseData'].map(
            (item) => MonthToMonthItem.fromJson(item),
          ),
        ),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
