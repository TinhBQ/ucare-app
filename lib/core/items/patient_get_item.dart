import '../utils/convert_to_int.dart';
import 'base_get_item.dart';
import 'patient_item.dart';

class PatientGetItem extends BaseGetItem<PatientItem> {
  PatientGetItem({
    required super.count,
    required super.rows,
    required super.totalPages,
    required super.currentPage,
  });

  factory PatientGetItem.fromJson(Map<String, dynamic> json) {
    return PatientGetItem(
      count: convertToInt(json['count']) ?? 0,
      rows: List<PatientItem>.from(
        json['rows'].map(
          (item) => PatientItem.fromJson(item),
        ),
      ),
      totalPages: convertToInt(json['totalPages']) ?? 0,
      currentPage: convertToInt(json['currentPage']) ?? 0,
    );
  }

  PatientGetItem copyWith({
    int? count,
    List<PatientItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return PatientGetItem(
      count: count ?? this.count,
      rows: rows ?? this.rows,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  PatientGetItem copyWithAddRow({
    int? count,
    List<PatientItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return PatientGetItem(
      count: count ?? this.count,
      rows: rows == null ? this.rows : [...this.rows, ...rows],
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
