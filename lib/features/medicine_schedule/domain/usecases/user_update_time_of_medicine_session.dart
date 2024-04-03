import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/medicine_schedule_repository.dart';

class UserUpdateTimeOfMedicineSession
    implements UseCase<String, MedicineSessionItem> {
  final MedicineScheduleRepository medicineScheduleRepository;
  UserUpdateTimeOfMedicineSession(this.medicineScheduleRepository);

  @override
  Future<Either<Failure, String>> call(MedicineSessionItem item) async {
    return await medicineScheduleRepository.updateTimeMedicineSession(item);
  }
}
