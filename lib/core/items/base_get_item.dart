class BaseGetItem<T> {
  final int count;
  final List<T> rows;
  final int totalPages;
  final String currentPage;

  BaseGetItem({
    required this.count,
    required this.rows,
    required this.totalPages,
    required this.currentPage,
  });

  factory BaseGetItem.fromJson(Map<String, dynamic> json) {
    return BaseGetItem(
      count: json['count'] ?? 0,
      rows: json['rows'] ?? [],
      totalPages: json['totalPages'] ?? 0,
      currentPage: json['currentPage'] ?? '0',
    );
  }
}
