import 'package:mobile_advanced_project_fe/core/utils/utils.dart';

class BaseGetItem<T> {
  final int count;
  final List<T> rows;
  final int totalPages;
  final int currentPage;

  BaseGetItem({
    required this.count,
    required this.rows,
    required this.totalPages,
    required this.currentPage,
  });

  factory BaseGetItem.fromJson(Map<String, dynamic> json) {
    return BaseGetItem(
      count: convertToInt(json['count']) ?? 0,
      rows: json['rows'] ?? [],
      totalPages: convertToInt(json['totalPages']) ?? 0,
      currentPage: convertToInt(json['currentPage']) ?? 0,
    );
  }
}
