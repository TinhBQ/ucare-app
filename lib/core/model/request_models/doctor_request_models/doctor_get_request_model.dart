// ignore_for_file: non_constant_identifier_names

part of './doctor_request_model_dependencies.dart';

class DoctorGetRequestModel extends BaseGetRequestModel {
  final String? user_name;
  final String? session_of_day;
  DoctorGetRequestModel({
    super.currentPage = "1",
    super.pageSize = "10",
    super.filters,
    super.sortField,
    super.sortOrder,
    this.user_name,
    this.session_of_day,
  });

  @override
  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "pageSize": pageSize,
        "filters": filters,
        "sortField": sortField,
        "sortOrder": sortOrder,
        "user_name": user_name,
        "session_of_day": session_of_day
      };

  @override
  DoctorGetRequestModel copyWith({
    String? currentPage,
    String? pageSize,
    String? filters,
    String? sortField,
    String? sortOrder,
    String? user_name,
    String? session_of_day,
  }) {
    return DoctorGetRequestModel(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      filters: filters ?? this.filters,
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
      user_name: user_name ?? this.user_name,
      session_of_day: session_of_day ?? this.session_of_day,
    );
  }
}
