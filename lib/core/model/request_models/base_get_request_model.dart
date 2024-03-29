class BaseGetRequestModel {
  final String? currentPage;
  final String? pageSize;
  final String? filters;
  final String? sortField;
  final String? sortOrder;

  BaseGetRequestModel({
    this.currentPage,
    this.pageSize,
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
}
