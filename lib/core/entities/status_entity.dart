// ignore_for_file: non_constant_identifier_names

part of 'entity_dependencies.dart';

class StatusEntity {
  final String id;
  final String name;
  final String? name_en;
  final String? code;
  final String? description;
  final String? group;
  final String? sub_group;

  StatusEntity({
    required this.id,
    required this.name,
    this.name_en,
    this.code,
    this.description,
    this.group,
    this.sub_group,
  });
}
