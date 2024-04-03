// ignore_for_file: constant_identifier_names

import 'package:timezone/timezone.dart';
import 'package:date_format/date_format.dart';

class DateStrFormat {
  static const String DATE = 'dd-MM-yyyy';
  static const String DATE_AND_TIME = 'dd-MM-yyyy hh:mm';

  static List<String> formats = [DATE, DATE_AND_TIME];
}

class TimeZone {
  late final Location targetLocationObject;

  Future<TimeZone> init(String targetLocation) async {
    targetLocationObject = getLocation(targetLocation);
    return this;
  }

// Hàm định dạng ngày
  String fDate(DateTime date, [String fm = DateStrFormat.DATE]) {
    final targetDateTime = TZDateTime.from(date, targetLocationObject);
    return formatDate(targetDateTime, [fm]);
  }

  // Hàm định dạng ngày giờ
  String fDateTime(DateTime date, [String fm = DateStrFormat.DATE_AND_TIME]) {
    final targetDateTime = TZDateTime.from(date, targetLocationObject);
    return formatDate(targetDateTime, [fm]);
  }

  String? fStrDateToUTC(String date, [String fm = DateStrFormat.DATE]) {
    if (!DateStrFormat.formats.contains(fm)) return null;
    try {
      return TZDateTime.from(DateTime.parse(date), targetLocationObject)
          .toUtc()
          .toString();
    } catch (e) {
      return null;
    }
  }

  String? fStrDateToLocal(String date, [String fm = DateStrFormat.DATE]) {
    if (!DateStrFormat.formats.contains(fm)) return null;
    try {
      return TZDateTime.from(DateTime.parse(date), targetLocationObject)
          .toLocal()
          .toString();
    } catch (e) {
      return null;
    }
  }

  String? fStrDateFromUTCToTargetLocation(String date,
      [String fm = DateStrFormat.DATE]) {
    try {
      final targetDateTime =
          TZDateTime.from(DateTime.parse(date), targetLocationObject);
      final formattedDate = formatDate(targetDateTime, [date]);

      if (DateStrFormat.formats.contains(date)) {
        return formattedDate;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  String? fStrDateFromUTCToLocal(String date,
      [String fm = DateStrFormat.DATE]) {
    try {
      final targetDateTime = TZDateTime.from(DateTime.parse(date), local);
      final formattedDate = formatDate(targetDateTime, [date]);

      if (DateStrFormat.formats.contains(date)) {
        return formattedDate;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  int distanceToNow(DateTime date) {
    final now = TZDateTime.now(local);
    final diff = now.difference(date);
    return diff.inDays;
  }

  int distanceBetweenDates(DateTime date1, DateTime date2) {
    final difference = date2.difference(date1);
    return difference.inDays.abs();
  }

  DateTime nDay(DateTime date) {
    return date.add(const Duration(days: 1));
  }
}
