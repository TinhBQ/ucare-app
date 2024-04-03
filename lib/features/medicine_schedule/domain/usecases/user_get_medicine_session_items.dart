import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/medicine_schedule_repository.dart';

class UserGetMedicineSessionItems
    implements UseCase<List<MedicineSessionItem>, NoParams> {
  final MedicineScheduleRepository medicineScheduleRepository;
  UserGetMedicineSessionItems(this.medicineScheduleRepository);

  @override
  Future<Either<Failure, List<MedicineSessionItem>>> call(
      NoParams params) async {
    return await medicineScheduleRepository.getMedicineSessionItems();
  }
}
