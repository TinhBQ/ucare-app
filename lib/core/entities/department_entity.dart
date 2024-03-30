// ignore_for_file: non_constant_identifier_names

class DepartmentEntity {
  final String id;
  final String name;
  final bool enable;
  final String description;
  final int service_charge;

  DepartmentEntity({
    required this.id,
    required this.name,
    required this.enable,
    required this.description,
    required this.service_charge,
  });
}
