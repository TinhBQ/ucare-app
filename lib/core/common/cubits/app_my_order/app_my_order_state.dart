part of 'app_my_order_cubit.dart';

sealed class AppMyOrderState extends Equatable {
  final MyOrderGetItem? myOrderGetItem;
  final BaseGetRequestModel baseGetRequestModel;

  const AppMyOrderState({
    this.myOrderGetItem,
    required this.baseGetRequestModel,
  });

  @override
  List<Object?> get props => [myOrderGetItem, baseGetRequestModel];
}

final class AppMyOrderScheduleInitial extends AppMyOrderState {
  const AppMyOrderScheduleInitial({
    required super.baseGetRequestModel,
  });

  @override
  List<Object?> get props => [baseGetRequestModel];
}

final class MyOrderScheduleDataLoaded extends AppMyOrderState {
  const MyOrderScheduleDataLoaded({
    super.myOrderGetItem,
    required super.baseGetRequestModel,
  });

  MyOrderScheduleDataLoaded copyWith({
    MyOrderGetItem? myOrderGetItem,
    BaseGetRequestModel? baseGetRequestModel,
  }) {
    return MyOrderScheduleDataLoaded(
      myOrderGetItem: myOrderGetItem ?? this.myOrderGetItem,
      baseGetRequestModel: baseGetRequestModel ?? this.baseGetRequestModel,
    );
  }

  @override
  List<Object?> get props => [myOrderGetItem, baseGetRequestModel];
}
