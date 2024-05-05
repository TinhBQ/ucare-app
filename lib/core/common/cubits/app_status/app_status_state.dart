part of 'app_status_cubit.dart';

sealed class AppStatusState extends Equatable {
  final StatusGetItem? statusGetItem;
  final BaseGetRequestModel baseGetRequestModel;
  const AppStatusState({
    this.statusGetItem,
    required this.baseGetRequestModel,
  });

  @override
  List<Object?> get props => [statusGetItem, baseGetRequestModel];
}

final class AppStatusInitial extends AppStatusState {
  const AppStatusInitial({required super.baseGetRequestModel});

  @override
  List<Object?> get props => [baseGetRequestModel];
}

final class StatusDataLoaded extends AppStatusState {
  const StatusDataLoaded({
    super.statusGetItem,
    required super.baseGetRequestModel,
  });

  StatusDataLoaded copyWith({
    StatusGetItem? statusGetItem,
    BaseGetRequestModel? baseGetRequestModel,
  }) {
    return StatusDataLoaded(
      statusGetItem: statusGetItem ?? this.statusGetItem,
      baseGetRequestModel: baseGetRequestModel ?? this.baseGetRequestModel,
    );
  }

  @override
  List<Object?> get props => [statusGetItem, baseGetRequestModel];
}
