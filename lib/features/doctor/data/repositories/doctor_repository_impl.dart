import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';

import '../../domain/repository/doctor_repository.dart';
import '../datasources/doctor_remote_data_source.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorRemoteDataSource doctorRemoteDataSource;

  DoctorRepositoryImpl(this.doctorRemoteDataSource);

  @override
  Future<Either<Failure, DoctorGetItem>> getListDoctors(
      DoctorGetRequestModel params) async {
    try {
      final doctorGetItem = await doctorRemoteDataSource.getListDoctors(params);
      return right(doctorGetItem!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
