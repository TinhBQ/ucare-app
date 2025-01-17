import 'package:mobile_advanced_project_fe/core/api/api_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/enum/enum_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/response_models.dart';

abstract interface class CountryRemoteDataSource {
  Future<CountryGetItem?> getCountries();
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  CountryRemoteDataSourceImpl();

  @override
  Future<CountryGetItem?> getCountries() async {
    CountryGetResponseModel response = await CountryApi.getCountries();
    return response.status == StatusResponse.success.name
        ? response.responseData
        : throw ServerException(ServerException.GET_FAIL);
  }
}
