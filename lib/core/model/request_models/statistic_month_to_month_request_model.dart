class StatisticMonthToMonthRequestModel {
  final String start;
  final String end;

  StatisticMonthToMonthRequestModel({
    required this.start,
    required this.end,
  });

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
      };
}
