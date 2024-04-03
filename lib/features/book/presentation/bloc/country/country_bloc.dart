import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';

import 'package:mobile_advanced_project_fe/core/usecase/usecase.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils.dart';

import '../../../domain/usecases/usecases.dart';

part 'country_event.dart';
part 'country_state.dart';

enum OnCountryEvent {
  onCountryGetList,
  onCountryChooseItem,
}

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final UserGetListCountry _userGetListCountry;

  CountryBloc({
    required UserGetListCountry userGetListCountry,
  })  : _userGetListCountry = userGetListCountry,
        super(CountryInitial()) {
    on<CountryEvent>((_, emit) => emit(CountryLoading()));
    on<CountryGetList>(_onCountryGetList);
  }

  void _onCountryGetList(
    CountryGetList event,
    Emitter<CountryState> emit,
  ) async {
    final res = await _userGetListCountry(NoParams());

    res.fold(
      (failure) => emit(CountryFailure(
        failure.message.toString(),
        OnCountryEvent.onCountryGetList,
      )),
      (countryGetItem) {
        return emit(CountrySuccess(
          InforMassage.GET_SUCCESS,
          OnCountryEvent.onCountryGetList,
          countryGetItem: countryGetItem,
        ));
      },
    );
  }
}
