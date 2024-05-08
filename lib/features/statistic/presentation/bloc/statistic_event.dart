part of 'statistic_bloc.dart';

sealed class StatisticEvent extends Equatable {
  const StatisticEvent();

  @override
  List<Object> get props => [];
}

class StatisticGetMonthToMonth extends StatisticEvent {
  final String start;
  final String end;

  const StatisticGetMonthToMonth({
    required this.start,
    required this.end,
  });
}
