import 'base_get_item.dart';
import 'deparment_item.dart';

class DepartmentGetItem extends BaseGetItem<DepartmentItem> {
  DepartmentGetItem({
    required super.count,
    required super.rows,
    required super.totalPages,
    required super.currentPage,
  });

  factory DepartmentGetItem.fromJson(Map<String, dynamic> json) {
    return DepartmentGetItem(
      count: json['count'] ?? 0,
      rows: List<DepartmentItem>.from(
        json['rows'].map(
          (item) => DepartmentItem.fromJson(item),
        ),
      ),
      totalPages: json['totalPages'] ?? 0,
      currentPage: json['description'] ?? '0',
    );
  }
}
