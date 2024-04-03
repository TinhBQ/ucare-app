import 'package:flutter/material.dart';

class InfoMedicalItem {
  final String title;
  final IconData icon;
  final IconData? iconRight;
  final VoidCallback? onPressed;
  InfoMedicalItem({
    required this.title,
    required this.icon,
    this.iconRight, 
    this.onPressed,
  });
}
