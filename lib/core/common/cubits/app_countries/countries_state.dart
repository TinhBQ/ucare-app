part of 'countries_cubit.dart';

sealed class CountriesState extends Equatable {
  final CountryGetItem? countriesItems;
  const CountriesState({
    this.countriesItems,
  });

  @override
  List<Object?> get props => [countriesItems];
}

final class CountriesInitial extends CountriesState {
  const CountriesInitial({
    super.countriesItems,
  });
  @override
  List<Object?> get props => [countriesItems];
}

final class CountriesLoaded extends CountriesState {
  const CountriesLoaded({super.countriesItems});
  CountriesLoaded copyWith({CountryGetItem? countriesItems}) {
    return CountriesLoaded(
      countriesItems: countriesItems ?? this.countriesItems,
    );
  }

  @override
  List<Object?> get props => [countriesItems];
}
