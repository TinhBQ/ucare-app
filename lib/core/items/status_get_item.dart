import 'package:mobile_advanced_project_fe/core/items/status_item.dart';

import '../utils/convert_to_int.dart';
import 'base_get_item.dart';

class StatusGetItem extends BaseGetItem<StatusItem> {
  StatusGetItem({
    required super.count,
    required super.rows,
    required super.totalPages,
    required super.currentPage,
  });

  factory StatusGetItem.fromJson(Map<String, dynamic> json) {
    return StatusGetItem(
      count: convertToInt(json['count']) ?? 0,
      rows: List<StatusItem>.from(
        json['rows'].map(
          (item) => StatusItem.fromJson(item),
        ),
      ),
      totalPages: convertToInt(json['totalPages']) ?? 0,
      currentPage: convertToInt(json['currentPage']) ?? 0,
    );
  }

  StatusGetItem copyWith({
    int? count,
    List<StatusItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return StatusGetItem(
      count: count ?? this.count,
      rows: rows ?? this.rows,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  StatusGetItem copyWithAddRow({
    int? count,
    List<StatusItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return StatusGetItem(
      count: count ?? this.count,
      rows: rows == null ? this.rows : [...this.rows, ...rows],
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
