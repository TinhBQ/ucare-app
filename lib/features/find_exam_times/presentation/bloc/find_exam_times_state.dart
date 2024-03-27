part of 'find_exam_times_bloc.dart';

sealed class FindExamTimesState extends Equatable {
  const FindExamTimesState();

  @override
  List<Object> get props => [];
}

final class FindExamTimesInitial extends FindExamTimesState {}

final class FindExamTimesLoading extends FindExamTimesState {}

final class FindExamTimesSuccess extends FindExamTimesState {
  final String message;
  final OnFindExamTimesEvent onFindExamTimesEvent;
  final DepartmentGetItem? departmentGetItem;

  const FindExamTimesSuccess(
    this.message,
    this.onFindExamTimesEvent, {
    this.departmentGetItem,
  });
}

final class FindExamTimesFailure extends FindExamTimesState {
  final String message;
  final OnFindExamTimesEvent onFindExamTimesEvent;
  const FindExamTimesFailure(this.message, this.onFindExamTimesEvent);
}
