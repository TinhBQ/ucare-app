part of './item_dependencies.dart';

class DocterFilerItem {
  final DepartmentItem? departmentFilterItem;
  final SessionOfDayItem? sessionOfDayFilterItem;
  final String? doctorSearchName;

  DocterFilerItem({
    this.departmentFilterItem,
    this.sessionOfDayFilterItem,
    this.doctorSearchName,
  });

  DocterFilerItem copyWith({
    DepartmentItem? departmentFilterItem,
    SessionOfDayItem? sessionOfDayFilterItem,
    String? doctorSearchName,
  }) {
    return DocterFilerItem(
      departmentFilterItem: departmentFilterItem ?? this.departmentFilterItem,
      sessionOfDayFilterItem:
          sessionOfDayFilterItem ?? this.sessionOfDayFilterItem,
      doctorSearchName: doctorSearchName ?? this.doctorSearchName,
    );
  }

  String strDepartmentFilter() {
    if (departmentFilterItem == null || departmentFilterItem?.id == '0') {
      return '';
    }
    return 'department_id==${departmentFilterItem?.id}';
  }

  String strSessionOfDayFilter() {
    if (sessionOfDayFilterItem?.id == '0') {
      return '';
    }
    return sessionOfDayFilterItem?.id ?? '';
  }

  String strDoctorSearchName() {
    if (doctorSearchName == null || doctorSearchName == '') {
      return '';
    }
    return doctorSearchName!;
  }
}
