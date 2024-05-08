import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/cubits/app_my_order/app_my_order_cubit.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/usecases/usecases.dart';

part 'order_event.dart';
part 'order_state.dart';

enum OnOrderEvent {
  onOrderPayment,
  onOrderExcute,
  onOrderPaymentReturnURL,
  onOrderGetMyList,
}

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final UserOrderPayment _userOrderPayment;
  final UserOrder _userOrder;
  final UserOrderPaymentReturnURL _userOrderReturnURL;
  final UserGetMyOrder _userGetMyOrder;

  final AppMyOrderCubit _appMyOrderCubit;

  OrderBloc({
    required UserOrderPayment userOrderPayment,
    required UserOrder userOrder,
    required UserOrderPaymentReturnURL userOrderReturnURL,
    required UserGetMyOrder userGetMyOrder,
    required AppMyOrderCubit appMyOrderCubit,
  })  : _userOrderPayment = userOrderPayment,
        _userOrder = userOrder,
        _userOrderReturnURL = userOrderReturnURL,
        _userGetMyOrder = userGetMyOrder,
        _appMyOrderCubit = appMyOrderCubit,
        super(OrderInitial()) {
    on<OrderEvent>((_, emit) => emit(OrderLoading()));
    on<OrderPayment>(_onOrderPayment);
    on<OrderExcute>(_onOrderExcute);
    on<OrderPaymentReturnURL>(_onOrderPaymentReturnURL);

    on<OrderGetMyList>(_onOrderGetMyList);
  }

  void _onOrderPayment(
    OrderPayment event,
    Emitter<OrderState> emit,
  ) async {
    final res = await _userOrderPayment(
      OrderPaymentRequestModel(
        orderPaymentRequestItems: event.orderPaymentRequestItems,
      ),
    );

    res.fold(
      (failure) => emit(OrderFailure(
        failure.message.toString(),
        OnOrderEvent.onOrderPayment,
      )),
      (paymentItems) {
        return emit(OrderSuccess(
          "",
          OnOrderEvent.onOrderPayment,
          paymentItems: paymentItems,
        ));
      },
    );
  }

  void _onOrderExcute(
    OrderExcute event,
    Emitter<OrderState> emit,
  ) async {
    final res = await _userOrder(
      OrderRequestModel(
        orderRequestItems: event.orderRequestItems,
      ),
    );

    res.fold(
      (failure) => emit(OrderFailure(
        failure.message.toString(),
        OnOrderEvent.onOrderExcute,
      )),
      (orderItems) {
        return emit(OrderSuccess(
          "",
          OnOrderEvent.onOrderExcute,
          orderItems: orderItems,
        ));
      },
    );
  }

  void _onOrderPaymentReturnURL(
    OrderPaymentReturnURL event,
    Emitter<OrderState> emit,
  ) async {
    final res = await _userOrderReturnURL(
      OrderPaymentReturnURLRequestModel(
        order_id: event.order_id,
        amount: event.amount,
        info: event.info,
        returnUrl: event.returnUrl,
      ),
    );

    res.fold(
      (failure) => emit(OrderFailure(
        failure.message.toString(),
        OnOrderEvent.onOrderPaymentReturnURL,
      )),
      (link) {
        return emit(OrderSuccess(
          "",
          OnOrderEvent.onOrderPaymentReturnURL,
          link: link,
        ));
      },
    );
  }

  void _onOrderGetMyList(
    OrderGetMyList event,
    Emitter<OrderState> emit,
  ) async {
    final res = await _userGetMyOrder(
      BaseGetRequestModel(
        currentPage: event.currentPage,
        pageSize: event.pageSize,
        filters: event.filters,
        sortField: event.sortField,
        sortOrder: event.sortOrder,
      ),
    );
    res.fold(
      (failure) => emit(OrderFailure(
        failure.message.toString(),
        OnOrderEvent.onOrderGetMyList,
      )),
      (myOrderGetItem) {
        _appMyOrderCubit.updateMyOrder(myOrderGetItem);
        return emit(OrderSuccess(
          "",
          OnOrderEvent.onOrderGetMyList,
          myOrderGetItem: myOrderGetItem,
        ));
      },
    );
  }
}
