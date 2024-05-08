part of './schedule_request_model_dependencies.dart';

class ScheduleCancelRequestModel {
  final String id;
  final String status_id;

  const ScheduleCancelRequestModel({
    required this.id,
    required this.status_id,
  });

  Map<String, dynamic> toJson() => {
        "status_id": status_id,
      };
}
