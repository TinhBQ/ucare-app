// ignore_for_file: non_constant_identifier_names

part of 'schedule_bloc.dart';

sealed class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object> get props => [];
}

final class ScheduleGetList extends ScheduleEvent {
  final String? currentPage;
  final String? pageSize;
  final String? filters;
  final String? sortField;
  final String? sortOrder;
  final String? department_id;

  const ScheduleGetList({
    this.currentPage = '1',
    this.pageSize = '1000',
    this.filters,
    this.sortField,
    this.sortOrder,
    this.department_id,
  });

  ScheduleGetList copyWith({
    String? currentPage,
    String? pageSize,
    String? filters,
    String? sortField,
    String? sortOrder,
    String? department_id,
  }) {
    return ScheduleGetList(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      filters: filters ?? this.filters,
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
      department_id: department_id ?? this.department_id,
    );
  }
}
