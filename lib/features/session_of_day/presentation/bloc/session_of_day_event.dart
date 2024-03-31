part of 'session_of_day_bloc.dart';

sealed class SessionOfDayEvent extends Equatable {
  const SessionOfDayEvent();

  @override
  List<Object> get props => [];
}

final class SessionOfDayGetList extends SessionOfDayEvent {
  final String? currentPage;
  final String? pageSize;
  final String? filters;
  final String? sortField;
  final String? sortOrder;

  const SessionOfDayGetList({
    this.currentPage = '1',
    this.pageSize = '10',
    this.filters,
    this.sortField,
    this.sortOrder,
  });

  SessionOfDayGetList copyWith({
    String? currentPage,
    String? pageSize,
    String? filters,
    String? sortField,
    String? sortOrder,
  }) {
    return SessionOfDayGetList(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      filters: filters ?? this.filters,
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
