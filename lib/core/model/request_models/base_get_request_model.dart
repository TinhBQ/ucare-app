class BaseGetRequestModel {
  final String? currentPage;
  final String? pageSize;
  final String? filters;
  final String? sortField;
  final String? sortOrder;

  BaseGetRequestModel({
    this.currentPage = "1",
    this.pageSize = "10",
    this.filters,
    this.sortField,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "pageSize": pageSize,
        "filters": filters,
        "sortField": sortField,
        "sortOrder": sortOrder,
      };

  BaseGetRequestModel copyWith({
    String? currentPage,
    String? pageSize,
    String? filters,
    String? sortField,
    String? sortOrder,
  }) {
    return BaseGetRequestModel(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      filters: filters ?? this.filters,
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
