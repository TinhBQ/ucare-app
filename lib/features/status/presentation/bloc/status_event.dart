part of 'status_bloc.dart';

sealed class StatusEvent extends Equatable {
  const StatusEvent();

  @override
  List<Object> get props => [];
}

final class StatusGetList extends StatusEvent {
  final String? currentPage;
  final String? pageSize;
  final String? filters;
  final String? sortField;
  final String? sortOrder;

  const StatusGetList({
    this.currentPage = '1',
    this.pageSize = '20',
    this.filters,
    this.sortField,
    this.sortOrder,
  });

  StatusGetList copyWith({
    String? currentPage,
    String? pageSize,
    String? filters,
    String? sortField,
    String? sortOrder,
  }) {
    return StatusGetList(
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      filters: filters ?? this.filters,
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
