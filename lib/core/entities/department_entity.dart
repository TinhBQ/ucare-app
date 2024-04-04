// ignore_for_file: non_constant_identifier_names

class DepartmentEntity {
  final String id;
  final String name;
  final String? description;
  final int? service_charge;

  DepartmentEntity({
    required this.id,
    required this.name,
    this.description,
    this.service_charge,
  });
}
