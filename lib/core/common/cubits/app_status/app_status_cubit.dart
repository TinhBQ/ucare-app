import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

part 'app_status_state.dart';

class AppStatusCubit extends Cubit<AppStatusState> {
  StatusGetItem? _previouStatusGetItem;

  AppStatusCubit()
      : super(AppStatusInitial(baseGetRequestModel: BaseGetRequestModel()));

  void updateStatus(StatusGetItem? statusGetItem) {
    if (statusGetItem == null) {
      return;
    }

    if (_previouStatusGetItem == null || statusGetItem.currentPage == 1) {
      emit(StatusDataLoaded(
        statusGetItem: statusGetItem,
        baseGetRequestModel: state.baseGetRequestModel,
      ));
    } else {
      emit(
        StatusDataLoaded(
          statusGetItem: _previouStatusGetItem?.copyWithAddRow(
            count: statusGetItem.count,
            rows: statusGetItem.rows,
            totalPages: statusGetItem.totalPages,
            currentPage: statusGetItem.currentPage,
          ),
          baseGetRequestModel: state.baseGetRequestModel,
        ),
      );
    }
    _previouStatusGetItem = statusGetItem;
  }
}
