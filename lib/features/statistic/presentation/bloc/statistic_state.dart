part of 'statistic_bloc.dart';

sealed class StatisticState extends Equatable {
  const StatisticState();

  @override
  List<Object> get props => [];
}

final class StatisticInitial extends StatisticState {}

final class StatisticLoading extends StatisticState {}

final class StatisticStateSuccess extends StatisticState {
  final String message;
  final OnStatisticEvent onStatisticEvent;
  final List<MonthToMonthItem>? monthToMonthItems;

  const StatisticStateSuccess(
    this.message,
    this.onStatisticEvent, {
    this.monthToMonthItems,
  });
}

final class StatisticStateFailure extends StatisticState {
  final String message;
  final OnStatisticEvent onStatisticEvent;
  const StatisticStateFailure(
    this.message,
    this.onStatisticEvent,
  );
}
