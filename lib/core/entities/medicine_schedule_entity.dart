class MedicineSessionEntity {
  final int id;
  final String session;
  final String icon;
  final int isActived;
  final int hour;
  final int minute;

  MedicineSessionEntity({
    required this.id,
    required this.session,
    required this.icon,
    required this.isActived,
    required this.hour,
    required this.minute,
  });
}
