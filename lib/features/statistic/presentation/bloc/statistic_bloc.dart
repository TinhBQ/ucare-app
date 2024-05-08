import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/features/statistic/domain/usecases/usecases.dart';

part 'statistic_event.dart';
part 'statistic_state.dart';

enum OnStatisticEvent {
  onStatisticGetMonthToMonth,
}

class StatisticBloc extends Bloc<StatisticEvent, StatisticState> {
  final UserGetStatisticMonthToMonth _userGetStatisticMonthToMonth;

  StatisticBloc({
    required UserGetStatisticMonthToMonth userGetStatisticMonthToMonth,
  })  : _userGetStatisticMonthToMonth = userGetStatisticMonthToMonth,
        super(StatisticInitial()) {
    on<StatisticEvent>((_, emit) => emit(StatisticLoading()));
    on<StatisticGetMonthToMonth>(_onStatisticGetMonthToMonth);
  }

  void _onStatisticGetMonthToMonth(
    StatisticGetMonthToMonth event,
    Emitter<StatisticState> emit,
  ) async {
    final res = await _userGetStatisticMonthToMonth(
      StatisticMonthToMonthRequestModel(
        start: event.start,
        end: event.end,
      ),
    );

    res.fold(
      (failure) => emit(StatisticStateFailure(
        failure.message.toString(),
        OnStatisticEvent.onStatisticGetMonthToMonth,
      )),
      (monthToMonthItems) {
        return emit(StatisticStateSuccess(
          "",
          OnStatisticEvent.onStatisticGetMonthToMonth,
          monthToMonthItems: monthToMonthItems,
        ));
      },
    );
  }
}
