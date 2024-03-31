import 'deparment_item.dart';
import 'session_of_day_item.dart';

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
    if (sessionOfDayFilterItem == null || sessionOfDayFilterItem?.id == '0') {
      return '';
    }
    return 'session_of_day==${sessionOfDayFilterItem?.id}';
  }

  String strDoctorSearchName() {
    if (doctorSearchName == null || doctorSearchName == '') {
      return '';
    }
    return doctorSearchName!;
  }

  String strFilter() {
    return '${strDepartmentFilter()},${strSessionOfDayFilter()}';
  }
}
