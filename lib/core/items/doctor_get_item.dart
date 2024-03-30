import '../utils/convert_to_int.dart';
import 'base_get_item.dart';
import 'doctor_item.dart';

class DoctorGetItem extends BaseGetItem<DoctorItem> {
  DoctorGetItem({
    required super.count,
    required super.rows,
    required super.totalPages,
    required super.currentPage,
  });

  factory DoctorGetItem.fromJson(Map<String, dynamic> json) {
    return DoctorGetItem(
      count: convertToInt(json['count']) ?? 0,
      rows: List<DoctorItem>.from(
        json['rows'].map(
          (item) => DoctorItem.fromJson(item),
        ),
      ),
      totalPages: convertToInt(json['totalPages']) ?? 0,
      currentPage: convertToInt(json['currentPage']) ?? 0,
    );
  }

  DoctorGetItem copyWith({
    int? count,
    List<DoctorItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return DoctorGetItem(
      count: count ?? this.count,
      rows: rows ?? this.rows,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  DoctorGetItem copyWithAddRow({
    int? count,
    List<DoctorItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return DoctorGetItem(
      count: count ?? this.count,
      rows: rows == null ? this.rows : [...this.rows, ...rows],
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
