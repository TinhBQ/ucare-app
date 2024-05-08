import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/base_get_request_model.dart';

part './app_my_order_state.dart';

class AppMyOrderCubit extends Cubit<AppMyOrderState> {
  MyOrderGetItem? _previouMyOrderGetItem;

  AppMyOrderCubit()
      : super(AppMyOrderScheduleInitial(
          baseGetRequestModel: BaseGetRequestModel(
            sortField: 'create_at',
            sortOrder: 'DESC',
          ),
        ));

  void updateMyOrder(MyOrderGetItem? myOrderGetItem) {
    if (myOrderGetItem == null) {
      return;
    }

    if (_previouMyOrderGetItem == null || myOrderGetItem.currentPage == 1) {
      emit(MyOrderScheduleDataLoaded(
        myOrderGetItem: myOrderGetItem,
        baseGetRequestModel: state.baseGetRequestModel,
      ));
    } else {
      emit(
        MyOrderScheduleDataLoaded(
          myOrderGetItem: _previouMyOrderGetItem?.copyWithAddRow(
            count: myOrderGetItem.count,
            rows: myOrderGetItem.rows,
            totalPages: myOrderGetItem.totalPages,
            currentPage: myOrderGetItem.currentPage,
          ),
          baseGetRequestModel: state.baseGetRequestModel,
        ),
      );
    }
    _previouMyOrderGetItem = myOrderGetItem;
  }

  void nextPage(String? currentPage) {
    if (currentPage == null) {
      return;
    }
    emit(
      MyOrderScheduleDataLoaded(
        myOrderGetItem: state.myOrderGetItem,
        baseGetRequestModel: state.baseGetRequestModel.copyWith(
          currentPage: currentPage,
        ),
      ),
    );
  }

  void onChangeStatus(String statusId) {
    emit(
      MyOrderScheduleDataLoaded(
        myOrderGetItem: state.myOrderGetItem,
        baseGetRequestModel: state.baseGetRequestModel.copyWith(
          filters: 'payment.status_id==$statusId',
        ),
      ),
    );
  }
}
