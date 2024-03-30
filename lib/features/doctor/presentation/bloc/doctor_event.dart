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

  const DoctorFindExamTimes({
    this.currentPage = '1',
    this.pageSize = '10',
    this.filters,
    this.sortField,
    this.sortOrder,
  });

  DoctorFindExamTimes copyWith({
    String? currentPage,
    String? pageSize,
    String? filters,
    String? sortField,
    String? sortOrder,
  }) {
    return DoctorFindExamTimes(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      filters: filters ?? this.filters,
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
