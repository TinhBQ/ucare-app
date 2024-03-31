// ignore_for_file: non_constant_identifier_names

import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

class DoctorGetRequestModel extends BaseGetRequestModel {
  final String? full_name;
  DoctorGetRequestModel({
    super.currentPage = "1",
    super.pageSize = "10",
    super.filters,
    super.sortField,
    super.sortOrder,
    this.full_name,
  });

  @override
  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "pageSize": pageSize,
        "filters": filters,
        "sortField": sortField,
        "sortOrder": sortOrder,
        "full_name": full_name,
      };

  @override
  DoctorGetRequestModel copyWith({
    String? currentPage,
    String? pageSize,
    String? filters,
    String? sortField,
    String? sortOrder,
    String? full_name,
  }) {
    return DoctorGetRequestModel(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      filters: filters ?? this.filters,
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
      full_name: full_name ?? this.full_name,
    );
  }
}
