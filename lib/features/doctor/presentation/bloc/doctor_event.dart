// ignore_for_file: non_constant_identifier_names

part of 'doctor_bloc.dart';

sealed class DoctorEvent extends Equatable {
  const DoctorEvent();

  @override
  List<Object> get props => [];
}

final class DoctorFindExamTimes extends DoctorEvent {
  final String? currentPage;
  final String? pageSize;
  final String? filters;
  final String? sortField;
  final String? sortOrder;
  final String? user_name;
  final String? session_of_day;

  const DoctorFindExamTimes({
    this.currentPage = '1',
    this.pageSize = '10',
    this.filters,
    this.sortField,
    this.sortOrder,
    this.user_name,
    this.session_of_day,
  });

  DoctorFindExamTimes copyWith(
      {String? currentPage,
      String? pageSize,
      String? filters,
      String? sortField,
      String? sortOrder,
      String? user_name,
      String? session_of_day}) {
    return DoctorFindExamTimes(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      filters: filters ?? this.filters,
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
      user_name: user_name ?? this.user_name,
      session_of_day: session_of_day ?? this.session_of_day,
    );
  }
}
