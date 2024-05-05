import '../utils/convert_to_int.dart';
import 'base_get_item.dart';
import 'patient_schedule_item.dart';

class PatientScheduleGetItem extends BaseGetItem<PatientScheduleItem> {
  PatientScheduleGetItem({
    required super.count,
    required super.rows,
    required super.totalPages,
    required super.currentPage,
  });

  factory PatientScheduleGetItem.fromJson(Map<String, dynamic> json) {
    return PatientScheduleGetItem(
      count: convertToInt(json['count']) ?? 0,
      rows: List<PatientScheduleItem>.from(
        json['rows'].map(
          (item) => PatientScheduleItem.fromJson(item),
        ),
      ),
      totalPages: convertToInt(json['totalPages']) ?? 0,
      currentPage: convertToInt(json['currentPage']) ?? 0,
    );
  }

  PatientScheduleGetItem copyWith({
    int? count,
    List<PatientScheduleItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return PatientScheduleGetItem(
      count: count ?? this.count,
      rows: rows ?? this.rows,
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  PatientScheduleGetItem copyWithAddRow({
    int? count,
    List<PatientScheduleItem>? rows,
    int? totalPages,
    int? currentPage,
  }) {
    return PatientScheduleGetItem(
      count: count ?? this.count,
      rows: rows == null ? this.rows : [...this.rows, ...rows],
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
