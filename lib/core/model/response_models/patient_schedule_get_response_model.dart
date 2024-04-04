import '../../enum/status_response.dart';
import '../../items/items.dart';
import 'base_response_model.dart';

class PatientScheduleGetResponseModel
    extends BaseReponseModel<PatientScheduleGetItem> {
  PatientScheduleGetResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory PatientScheduleGetResponseModel.fromJson(Map<String, dynamic> json) {
    print('bQT json ${json}');
    return PatientScheduleGetResponseModel(
      message: json["message"] ?? '',
      responseData: PatientScheduleGetItem.fromJson(json["responseData"]),
      status: json["status"] ?? StatusResponse.fail.name,
      timeStamp: json["timeStamp"] ?? '',
      violations: json["violations"],
    );
  }
}
