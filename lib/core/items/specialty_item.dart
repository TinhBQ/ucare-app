part of 'item_dependencies.dart';

class SpecialtyItem {
  final String title;
  final int price;
  final String? description;

  SpecialtyItem({
    required this.title,
    required this.price,
    this.description,
  });
}
