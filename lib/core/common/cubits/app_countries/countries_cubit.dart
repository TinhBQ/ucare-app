import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(const CountriesInitial());
  Future<void> updateCountries(CountryGetItem countriesItems) async {
    emit(
      CountriesLoaded(countriesItems: countriesItems),
    );
  }
}
