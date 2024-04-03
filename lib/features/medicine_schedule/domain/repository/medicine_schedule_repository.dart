import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';

abstract interface class MedicineScheduleRepository {
  Future<Either<Failure, List<MedicineSessionItem>>> getMedicineSessionItems();
  Future<Either<Failure, String>> updateTimeMedicineSession(
      MedicineSessionItem item);
  Future<Either<Failure, int>> checkedTimeMedicineSession(
      MedicineSessionItem item);
}
