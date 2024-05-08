// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'item_dependencies.dart';

class MonthToMonthItem {
  final String date;
  final int value;

  const MonthToMonthItem({
    required this.date,
    required this.value,
  });

  factory MonthToMonthItem.fromJson(Map<String, dynamic> json) =>
      MonthToMonthItem(
        date: json["date"],
        value: json["value"],
      );
}
