part of 'country_bloc.dart';

sealed class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];
}

final class CountryGetList extends CountryEvent {
  const CountryGetList();

  CountryGetList copyWith() {
    return const CountryGetList();
  }
}

final class CountryChooseItem extends CountryEvent {
  final CountryItem? countryItem;
  const CountryChooseItem({this.countryItem});
}
