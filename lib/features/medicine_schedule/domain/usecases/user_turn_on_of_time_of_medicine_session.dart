import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/medicine_schedule_repository.dart';

class UserTurnOnOfTimeOfMedicineSession
    implements UseCase<int, MedicineSessionItem> {
  final MedicineScheduleRepository medicineScheduleRepository;
  UserTurnOnOfTimeOfMedicineSession(this.medicineScheduleRepository);

  @override
  Future<Either<Failure, int>> call(MedicineSessionItem item) async {
    return await medicineScheduleRepository.checkedTimeMedicineSession(item);
  }
}
