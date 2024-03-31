import 'package:flutter/material.dart';

class MedicineSessionItem {
  final String session;
  final IconData icon;
  final bool isActived;
  final Function(bool) onChangedActive;
  final TimeOfDay time;
  final VoidCallback onChangedTime;
  
  MedicineSessionItem({
    required this.session,
    required this.icon,
    required this.isActived,
    required this.onChangedActive,
    required this.time,
    required this.onChangedTime
  });

}