import '../utils/convert_to_int.dart';
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
      count: convertToInt(json['count']) ?? 0,
      rows: List<DepartmentItem>.from(
        json['rows'].map(
          (item) => DepartmentItem.fromJson(item),
        ),
      ),
      totalPages: convertToInt(json['totalPages']) ?? 0,
      currentPage: convertToInt(json['currentPage']) ?? 0,
    );
  }

  DepartmentGetItem copyWith({
    int? count,
    List<DepartmentItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return DepartmentGetItem(
      count: count ?? this.count,
      rows: rows ?? this.rows,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  DepartmentGetItem copyWithAddRow({
    int? count,
    List<DepartmentItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return DepartmentGetItem(
      count: count ?? this.count,
      rows: rows == null ? this.rows : [...this.rows, ...rows],
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
