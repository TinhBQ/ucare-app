part of 'app_new_cubit.dart';

sealed class AppNewState extends Equatable {
  final NewGetItem? newGetItem;
  final BaseGetRequestModel baseGetRequestModel;
  const AppNewState({
    this.newGetItem,
    required this.baseGetRequestModel,
  });

  @override
  List<Object?> get props => [newGetItem, baseGetRequestModel];
}

final class AppNewInitial extends AppNewState {
  const AppNewInitial({
    required super.baseGetRequestModel,
  });

  @override
  List<Object?> get props => [baseGetRequestModel];
}

final class NewDataLoaded extends AppNewState {
  const NewDataLoaded({
    super.newGetItem,
    required super.baseGetRequestModel,
  });

  NewDataLoaded copyWith({
    NewGetItem? newGetItem,
    BaseGetRequestModel? baseGetRequestModel,
  }) {
    return NewDataLoaded(
      newGetItem: newGetItem ?? this.newGetItem,
      baseGetRequestModel: baseGetRequestModel ?? this.baseGetRequestModel,
    );
  }

  @override
  List<Object?> get props => [newGetItem, baseGetRequestModel];
}
