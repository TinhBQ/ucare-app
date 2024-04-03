import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';

import 'package:mobile_advanced_project_fe/core/items/items.dart';

import '../../domain/repository/medicine_schedule_repository.dart';
import '../datasources/medicine_schedule_remote_data_source.dart';

class MedicineScheduleRepositoryImpl implements MedicineScheduleRepository {
  MedicineScheduleRemoteDataSource medicineScheduleRemoteDataSource;

  MedicineScheduleRepositoryImpl(this.medicineScheduleRemoteDataSource);

  @override
  Future<Either<Failure, List<MedicineSessionItem>>>
      getMedicineSessionItems() async {
    try {
      final departmentGetItem =
          await medicineScheduleRemoteDataSource.getMedicineSessionItems();
      return right(departmentGetItem);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> updateTimeMedicineSession(
      MedicineSessionItem item) async {
    try {
      final message = await medicineScheduleRemoteDataSource
          .updateTimeMedicineSession(item);
      return right(message);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, int>> checkedTimeMedicineSession(
      MedicineSessionItem item) async {
    try {
      final checked = await medicineScheduleRemoteDataSource
          .checkedTimeMedicineSession(item);
      return right(checked);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
