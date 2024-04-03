import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';

abstract interface class CountryRepository {
  Future<Either<Failure, CountryGetItem>> getCountries();
}
