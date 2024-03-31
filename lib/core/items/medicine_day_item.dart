import 'package:flutter/material.dart';

class MedicineDayItem {
  final String title;
  final IconData icon;
  final DateTime day;
  final VoidCallback onChangedDay;
  MedicineDayItem({
    required this.title,
    required this.icon,
    required this.day,
    required this.onChangedDay,
  });
}
