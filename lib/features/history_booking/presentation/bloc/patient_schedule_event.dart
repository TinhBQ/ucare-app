part of 'patient_schedule_bloc.dart';

sealed class PatientScheduleEvent extends Equatable {
  const PatientScheduleEvent();

  @override
  List<Object> get props => [];
}

final class PatientScheduleGetList extends PatientScheduleEvent {
  
  final String? currentPage;
  final String? pageSize;
  final String? filters;
  final String? sortField;
  final String? sortOrder;

  const PatientScheduleGetList({
    this.currentPage = '1',
    this.pageSize = '100',
    this.filters,
    this.sortField,
    this.sortOrder,
  });

  PatientScheduleGetList copyWith({
    String? currentPage,
    String? pageSize,
    String? filters,
    String? sortField,
    String? sortOrder,
  }) {
    return PatientScheduleGetList(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      filters: filters ?? this.filters,
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
