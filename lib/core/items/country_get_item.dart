import 'country_item.dart';

class CountryGetItem {
  final List<CountryItem> countries;

  CountryGetItem({required this.countries});

  factory CountryGetItem.fromJson(List<dynamic> json) {
    List<CountryItem> countries =
        json.map((item) => CountryItem.fromJson(item)).toList();
    return CountryGetItem(countries: countries);
  }

  CountryGetItem copyWith({
    List<CountryItem>? countries,
  }) {
    return CountryGetItem(
      countries: countries ?? this.countries,
    );
  }

  CountryGetItem copyWithAddCountry({
    required CountryItem country,
  }) {
    return CountryGetItem(
      countries: [...countries, country],
    );
  }
}
