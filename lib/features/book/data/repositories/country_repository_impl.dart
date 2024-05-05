import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import '../../domain/repository/country_repository.dart';
import '../datasources/country_remote_data_source.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryRemoteDataSource countryRemoteDataSource;

  CountryRepositoryImpl(this.countryRemoteDataSource);

  @override
  Future<Either<Failure, CountryGetItem>> getCountries() async {
    try {
      final countryGetItem =
          await countryRemoteDataSource.getCountries();
      return right(countryGetItem!);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
