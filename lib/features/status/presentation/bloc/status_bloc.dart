import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_advanced_project_fe/core/common/cubits/app_status/app_status_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/usecases/user_get_statuses.dart';

part 'status_event.dart';
part 'status_state.dart';

enum OnStatusEvent {
  onStatusGetList,
}

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  final UserGetListStatus _userGetListStatus;
  final AppStatusCubit _appStatusCubit;

  StatusBloc({
    required UserGetListStatus userGetListStatus,
    required AppStatusCubit appStatusCubit,
  })  : _userGetListStatus = userGetListStatus,
        _appStatusCubit = appStatusCubit,
        super(StatusInitial()) {
    on<StatusEvent>((_, emit) => emit(StatusLoading()));
    on<StatusGetList>(_onStatusGetList);
  }

  void _onStatusGetList(
    StatusGetList event,
    Emitter<StatusState> emit,
  ) async {
    final res = await _userGetListStatus(
      BaseGetRequestModel(
        currentPage: event.currentPage,
        pageSize: event.pageSize,
        filters: event.filters,
        sortField: event.sortField,
        sortOrder: event.sortOrder,
      ),
    );

    res.fold(
      (failure) => emit(StatusFailure(
        failure.message.toString(),
        OnStatusEvent.onStatusGetList,
      )),
      (statusGetItem) {
        _appStatusCubit.updateStatus(statusGetItem);

        return emit(StatusSuccess(
          "",
          OnStatusEvent.onStatusGetList,
          statusGetItem: statusGetItem,
        ));
      },
    );
  }
}
