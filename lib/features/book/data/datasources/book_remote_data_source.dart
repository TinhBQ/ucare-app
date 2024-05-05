import 'package:mobile_advanced_project_fe/core/api/api.dart';
import 'package:mobile_advanced_project_fe/core/enum/enum.dart';
import 'package:mobile_advanced_project_fe/core/exceptions/exceptions.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/core/model/response_models/response_models.dart';

abstract interface class BookRemoteDataSource {
  Future<CountryGetItem?> getCountries();
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  BookRemoteDataSourceImpl();

  @override
  Future<CountryGetItem?> getCountries() async {
    BaseReponseModel response = await CountryApi.getCountries();

    return response.status == StatusResponse.success.name
        ? response.responseData
        : throw ServerException(ServerException.GET_FAIL);
  }
}
