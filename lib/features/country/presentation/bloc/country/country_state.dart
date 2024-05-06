part of 'country_bloc.dart';

sealed class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

final class CountryInitial extends CountryState {}

final class CountryLoading extends CountryState {}

final class CountrySuccess extends CountryState {
  final String message;
  final OnCountryEvent onCountryEvent;
  final CountryGetItem? countryGetItem;

  const CountrySuccess(
    this.message,
    this.onCountryEvent, {
    this.countryGetItem,
  });
}

final class CountryFailure extends CountryState {
  final String message;
  final OnCountryEvent onCountryEvent;
  const CountryFailure(this.message, this.onCountryEvent);
}
