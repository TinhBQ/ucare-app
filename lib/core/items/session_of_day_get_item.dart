part of 'item_dependencies.dart';

class SessionOfDayGetItem extends BaseGetItem<SessionOfDayItem> {
  SessionOfDayGetItem({
    required super.count,
    required super.rows,
    required super.totalPages,
    required super.currentPage,
  });

  factory SessionOfDayGetItem.fromJson(Map<String, dynamic> json) {
    return SessionOfDayGetItem(
      count: convertToInt(json['count']) ?? 0,
      rows: List<SessionOfDayItem>.from(
        json['rows'].map(
          (item) => SessionOfDayItem.fromJson(item),
        ),
      ),
      totalPages: convertToInt(json['totalPages']) ?? 0,
      currentPage: convertToInt(json['currentPage']) ?? 0,
    );
  }

  SessionOfDayGetItem copyWith({
    int? count,
    List<SessionOfDayItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return SessionOfDayGetItem(
      count: count ?? this.count,
      rows: rows ?? this.rows,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  SessionOfDayGetItem copyWithAddRow({
    int? count,
    List<SessionOfDayItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return SessionOfDayGetItem(
      count: count ?? this.count,
      rows: rows == null ? this.rows : [...this.rows, ...rows],
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
