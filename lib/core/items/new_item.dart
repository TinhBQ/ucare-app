part of 'item_dependencies.dart';

class NewItem extends NewEntity {
  NewItem({
    required super.id,
    required super.title,
    required super.content,
    required super.image,
  });

  factory NewItem.fromJson(Map<String, dynamic> json) {
    return NewItem(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      image: json['image'],
    );
  }
}
