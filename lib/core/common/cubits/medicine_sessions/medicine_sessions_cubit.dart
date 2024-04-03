import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';

part 'medicine_sessions_state.dart';

class MedicineSessionsCubit extends Cubit<MedicineSessionsState> {
  MedicineSessionsCubit() : super(const MedicineSessionsInitial());

  Future<void> updateMedicineSessions(
      List<MedicineSessionItem> medicineSessionItems) async {
    emit(MedicineSessionsLoaded(medicineSessionItems: medicineSessionItems));
  }
}
