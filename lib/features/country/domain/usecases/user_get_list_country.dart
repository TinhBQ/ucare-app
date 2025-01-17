import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/country_repository.dart';

class UserGetListCountry implements UseCase<CountryGetItem, NoParams> {
  final CountryRepository bookRepository;
  UserGetListCountry(this.bookRepository);

  @override
  Future<Either<Failure, CountryGetItem>> call(NoParams params) async {
    return await bookRepository.getCountries();
  }
}
