import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

import '../../domain/usecases/usecases.dart';

part 'session_of_day_event.dart';
part 'session_of_day_state.dart';

enum OnSessionOfDayEvent {
  onSessionOfDayGetList,
}

class SessionOfDayBloc extends Bloc<SessionOfDayEvent, SessionOfDayState> {
  final UserGetListSessionOfDay _userGetListSessionOfDay;

  SessionOfDayBloc({
    required UserGetListSessionOfDay userGetListSessionOfDay,
  })  : _userGetListSessionOfDay = userGetListSessionOfDay,
        super(SessionOfDayInitial()) {
    on<SessionOfDayEvent>((_, emit) => emit(SessionOfDayLoading()));
    on<SessionOfDayGetList>(_onSessionOfDayGetList);
  }

  void _onSessionOfDayGetList(
    SessionOfDayGetList event,
    Emitter<SessionOfDayState> emit,
  ) async {
    final res = await _userGetListSessionOfDay(
      BaseGetRequestModel(
        currentPage: event.currentPage,
        pageSize: event.pageSize,
        filters: event.filters,
        sortField: event.sortField,
        sortOrder: event.sortOrder,
      ),
    );

    res.fold(
      (failure) => emit(SessionOfDayFailure(
        failure.message.toString(),
        OnSessionOfDayEvent.onSessionOfDayGetList,
      )),
      (sessionOfDayGetItem) {
        return emit(SessionOfDaySuccess(
          InforMassage.GET_LIST_SESSION_OF_DAY_SUCCESS,
          OnSessionOfDayEvent.onSessionOfDayGetList,
          sessionOfDayGetItem: sessionOfDayGetItem,
        ));
      },
    );
  }
}
