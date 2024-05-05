// ignore_for_file: constant_identifier_names

import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart';

class DateStrFormat {
  static const String DATE = 'dd-MM-yyyy';
  static const String DateInput = 'yyyy-MM-dd';
  static const String DATE_AND_TIME = 'dd-MM-yyyy hh:mm';

  static List<String> formats = [DATE, DATE_AND_TIME];
}

class UCARETimeZone {
  static String fDate(
    DateTime date, {
    String fm = DateStrFormat.DATE,
    String targetLocation = "Asia/Ho_Chi_Minh",
  }) {
    Location targetLocationObject = getLocation(targetLocation);
    final targetDateTime = TZDateTime.from(date, targetLocationObject);
    return DateFormat(fm).format(targetDateTime);
  }

  // Hàm định dạng ngày giờ
  static String fDateTime(
    DateTime date, [
    String fm = DateStrFormat.DATE_AND_TIME,
    String targetLocation = "Asia/Ho_Chi_Minh",
  ]) {
    Location targetLocationObject = getLocation(targetLocation);
    final targetDateTime = TZDateTime.from(date, targetLocationObject);
    return DateFormat(fm).format(targetDateTime);
  }

  static DateTime? fStrDateToUTC(
    String date, {
    String fm = DateStrFormat.DATE,
    String targetLocation = "Asia/Ho_Chi_Minh",
  }) {
    // if (!DateStrFormat.formats.contains(fm)) return null;
    try {
      Location targetLocationObject = getLocation(targetLocation);
      return TZDateTime.from(DateTime.parse(date), targetLocationObject)
          .toUtc();
    } catch (e) {
      return null;
    }
  }

  static DateTime? fStrDateToLocal(
    String date, [
    String fm = DateStrFormat.DATE,
    String targetLocation = "Asia/Ho_Chi_Minh",
  ]) {
    if (!DateStrFormat.formats.contains(fm)) return null;
    try {
      Location targetLocationObject = getLocation(targetLocation);
      return TZDateTime.from(DateTime.parse(date), targetLocationObject)
          .toLocal();
    } catch (e) {
      return null;
    }
  }

  static DateTime? fStrDateFromUTCToTargetLocation(
    String date, [
    String fm = DateStrFormat.DATE,
    String targetLocation = "Asia/Ho_Chi_Minh",
  ]) {
    try {
      Location targetLocationObject = getLocation(targetLocation);
      final targetDateTime =
          TZDateTime.from(DateTime.parse(date), targetLocationObject);

      if (DateStrFormat.formats.contains(fm)) {
        return targetDateTime;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static DateTime? fStrDateFromUTCToLocal(String date,
      [String fm = DateStrFormat.DATE]) {
    try {
      final targetDateTime = TZDateTime.from(DateTime.parse(date), local);

      if (DateStrFormat.formats.contains(fm)) {
        return targetDateTime;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static int distanceToNow(DateTime date) {
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
