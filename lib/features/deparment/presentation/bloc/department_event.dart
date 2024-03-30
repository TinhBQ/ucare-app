part of 'department_bloc.dart';

sealed class DepartmentEvent extends Equatable {
  const DepartmentEvent();

  @override
  List<Object> get props => [];
}

final class DepartmentGetList extends DepartmentEvent {
  final String? currentPage;
  final String? pageSize;
  final String? filters;
  final String? sortField;
  final String? sortOrder;

  const DepartmentGetList({
    this.currentPage,
    this.pageSize,
    this.filters,
    this.sortField,
    this.sortOrder,
  });

  DepartmentGetList copyWith({
    String? currentPage,
    String? pageSize,
    String? filters,
    String? sortField,
    String? sortOrder,
  }) {
    return DepartmentGetList(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      filters: filters ?? this.filters,
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}

final class DepartmentChooseItem extends DepartmentEvent {
  final DepartmentItem? departmentItem;
  const DepartmentChooseItem({this.departmentItem});
}
