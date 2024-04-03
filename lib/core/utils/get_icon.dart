import 'package:flutter/material.dart';

IconData getIcon(String iconName) {
  switch (iconName) {
    case 'wb_sunny_outlined':
      return Icons.wb_sunny_outlined;
    case 'sunny':
      return Icons.sunny;
    case 'sunny_snowing':
      return Icons.sunny_snowing;
    case 'nightlight_round':
      return Icons.nightlight_round;
    case 'night_shelter':
      return Icons.night_shelter;
    case 'accessibility_outlined':
      return Icons.accessibility_outlined;
    default:
      return Icons.error; // Hoặc biểu tượng mặc định khác
  }
}
