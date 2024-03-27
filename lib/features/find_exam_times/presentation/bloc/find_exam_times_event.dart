part of 'find_exam_times_bloc.dart';

sealed class FindExamTimesEvent extends Equatable {
  const FindExamTimesEvent();

  @override
  List<Object> get props => [];
}

final class FindExamTimesGetDepartments extends FindExamTimesEvent {
  final String? currentPage;
  final String? pageSize;
  final String? filters;
  final String? sortField;
  final String? sortOrder;

  const FindExamTimesGetDepartments({
    this.currentPage,
    this.pageSize,
    this.filters,
    this.sortField,
    this.sortOrder,
  });
}
