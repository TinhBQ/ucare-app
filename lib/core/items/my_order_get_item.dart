part of './item_dependencies.dart';

class MyOrderGetItem extends BaseGetItem<MyOrderItem> {
  MyOrderGetItem({
    required super.count,
    required super.rows,
    required super.totalPages,
    required super.currentPage,
  });

  factory MyOrderGetItem.fromJson(Map<String, dynamic> json) {
    return MyOrderGetItem(
      count: convertToInt(json['count']) ?? 0,
      rows: List<MyOrderItem>.from(
        json['rows'].map(
          (item) => MyOrderItem.fromJson(item),
        ),
      ),
      totalPages: convertToInt(json['totalPages']) ?? 0,
      currentPage: convertToInt(json['currentPage']) ?? 0,
    );
  }

  MyOrderGetItem copyWith({
    int? count,
    List<MyOrderItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return MyOrderGetItem(
      count: count ?? this.count,
      rows: rows ?? this.rows,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  MyOrderGetItem copyWithAddRow({
    int? count,
    List<MyOrderItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return MyOrderGetItem(
      count: count ?? this.count,
      rows: rows == null ? this.rows : [...this.rows, ...rows],
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
