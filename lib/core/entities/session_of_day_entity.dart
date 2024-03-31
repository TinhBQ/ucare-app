class SessionOfDayEntity {
  final String id;
  final String content;
  final bool? enable;

  SessionOfDayEntity({
    required this.id,
    required this.content,
    this.enable = false,
  });
}
