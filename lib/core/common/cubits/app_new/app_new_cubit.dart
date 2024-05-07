import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

part 'app_new_state.dart';

class AppNewCubit extends Cubit<AppNewState> {
  NewGetItem? _previouNewGetItem;

  AppNewCubit()
      : super(AppNewInitial(baseGetRequestModel: BaseGetRequestModel()));

  void updateNew(NewGetItem? newGetItem) {
    if (newGetItem == null) {
      return;
    }

    if (_previouNewGetItem == null || newGetItem.currentPage == 1) {
      emit(NewDataLoaded(
        newGetItem: newGetItem,
        baseGetRequestModel: state.baseGetRequestModel,
      ));
    } else {
      emit(
        NewDataLoaded(
          newGetItem: _previouNewGetItem?.copyWithAddRow(
            count: newGetItem.count,
            rows: newGetItem.rows,
            totalPages: newGetItem.totalPages,
            currentPage: newGetItem.currentPage,
          ),
          baseGetRequestModel: state.baseGetRequestModel,
        ),
      );
    }
    _previouNewGetItem = newGetItem;
  }

  void nextPage(String? currentPage) {
    if (currentPage == null) {
      return;
    }
    emit(
      NewDataLoaded(
        newGetItem: state.newGetItem,
        baseGetRequestModel: state.baseGetRequestModel.copyWith(
          currentPage: currentPage,
        ),
      ),
    );
  }
}
