part of './item_dependencies.dart';

class NewGetItem extends BaseGetItem<NewItem> {
  NewGetItem({
    required super.count,
    required super.rows,
    required super.totalPages,
    required super.currentPage,
  });

  factory NewGetItem.fromJson(Map<String, dynamic> json) {
    return NewGetItem(
      count: convertToInt(json['count']) ?? 0,
      rows: List<NewItem>.from(
        json['rows'].map(
          (item) => NewItem.fromJson(item),
        ),
      ),
      totalPages: convertToInt(json['totalPages']) ?? 0,
      currentPage: convertToInt(json['currentPage']) ?? 0,
    );
  }

  NewGetItem copyWith({
    int? count,
    List<NewItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return NewGetItem(
      count: count ?? this.count,
      rows: rows ?? this.rows,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  NewGetItem copyWithAddRow({
    int? count,
    List<NewItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return NewGetItem(
      count: count ?? this.count,
      rows: rows == null ? this.rows : [...this.rows, ...rows],
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
