part of './response_models.dart';

class FileGetResponseModel extends BaseReponseModel<FileItem> {
  FileGetResponseModel({
    required super.message,
    required super.responseData,
    required super.status,
    required super.timeStamp,
    required super.violations,
  });

  @override
  factory FileGetResponseModel.fromJson(Map<String, dynamic> json) =>
      FileGetResponseModel(
        message: json["message"] ?? '',
        responseData: FileItem.fromJson(json["responseData"]),
        status: json["status"] ?? StatusResponse.fail.name,
        timeStamp: json["timeStamp"] ?? '',
        violations: json["violations"],
      );
}
