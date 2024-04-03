import 'package:fpdart/fpdart.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/failures.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';

import '../repository/country_repository.dart';

class UserGetListCountry
    implements UseCase<CountryGetItem, NoParams> {
  final CountryRepository countryRepository;
  UserGetListCountry(this.countryRepository);

  @override
  Future<Either<Failure, CountryGetItem>> call(NoParams params) async {
    return await countryRepository.getCountries();
  }
}
