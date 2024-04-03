part of 'medicine_sessions_cubit.dart';

sealed class MedicineSessionsState extends Equatable {
  final List<MedicineSessionItem> medicineSessionItems;
  const MedicineSessionsState({
    this.medicineSessionItems = const [],
  });

  @override
  List<Object> get props => [medicineSessionItems];
}

final class MedicineSessionsInitial extends MedicineSessionsState {
  const MedicineSessionsInitial({
    super.medicineSessionItems = const [],
  });

  @override
  List<Object> get props => [medicineSessionItems];
}

final class MedicineSessionsLoaded extends MedicineSessionsState {
  const MedicineSessionsLoaded({super.medicineSessionItems});

  @override
  List<Object> get props => [medicineSessionItems];
}
