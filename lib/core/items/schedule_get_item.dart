import '../utils/convert_to_int.dart';
import 'base_get_item.dart';
import 'schedule_item.dart';

class ScheduleGetItem extends BaseGetItem<ScheduleItem> {
  ScheduleGetItem({
    required super.count,
    required super.rows,
    required super.totalPages,
    required super.currentPage,
  });

  factory ScheduleGetItem.fromJson(Map<String, dynamic> json) {
    return ScheduleGetItem(
      count: convertToInt(json['count']) ?? 0,
      rows: List<ScheduleItem>.from(
        json['rows'].map(
          (item) => ScheduleItem.fromJson(item),
        ),
      ),
      totalPages: convertToInt(json['totalPages']) ?? 0,
      currentPage: convertToInt(json['currentPage']) ?? 0,
    );
  }

  ScheduleGetItem copyWith({
    int? count,
    List<ScheduleItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return ScheduleGetItem(
      count: count ?? this.count,
      rows: rows ?? this.rows,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  ScheduleGetItem copyWithAddRow({
    int? count,
    List<ScheduleItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return ScheduleGetItem(
      count: count ?? this.count,
      rows: rows == null ? this.rows : [...this.rows, ...rows],
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
