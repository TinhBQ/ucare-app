// ignore_for_file: non_constant_identifier_names

part of './item_dependencies.dart';

class CountryItem extends CountryEntity {
  CountryItem({
    required super.name,
    required super.code,
    required super.dial_code,
  });

  factory CountryItem.fromJson(Map<String, dynamic> json) {
    return CountryItem(
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      dial_code: json['dial_code'] ?? '',
    );
  }
}
