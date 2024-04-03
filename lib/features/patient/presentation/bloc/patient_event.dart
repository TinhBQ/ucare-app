part of 'patient_bloc.dart';

sealed class PatientEvent extends Equatable {
  const PatientEvent();

  @override
  List<Object> get props => [];
}

final class PatientGetList extends PatientEvent {
  final String? currentPage;
  final String? pageSize;
  final String? filters;
  final String? sortField;
  final String? sortOrder;

  const PatientGetList({
    this.currentPage = '1',
    this.pageSize = '10',
    this.filters,
    this.sortField,
    this.sortOrder,
  });

  PatientGetList copyWith({
    String? currentPage,
    String? pageSize,
    String? filters,
    String? sortField,
    String? sortOrder,
  }) {
    return PatientGetList(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      filters: filters ?? this.filters,
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}