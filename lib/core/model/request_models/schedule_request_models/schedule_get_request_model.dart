// ignore_for_file: non_constant_identifier_names
part of './schedule_request_model_dependencies.dart';

class ScheduleGetRequestModel extends BaseGetRequestModel {
  final String? department_id;

  ScheduleGetRequestModel({
    super.currentPage = "1",
    super.pageSize = "10",
    super.filters,
    super.sortField,
    super.sortOrder,
    this.department_id,
  });

  @override
  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "pageSize": pageSize,
        "filters": filters,
        "sortField": sortField,
        "sortOrder": sortOrder,
        "department_id": department_id,
      };

  @override
  ScheduleGetRequestModel copyWith({
    String? currentPage,
    String? pageSize,
    String? filters,
    String? sortField,
    String? sortOrder,
    String? department_id,
  }) {
    return ScheduleGetRequestModel(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      filters: filters ?? this.filters,
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
      department_id: department_id ?? this.department_id,
    );
  }
}
