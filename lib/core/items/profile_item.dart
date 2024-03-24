import 'package:flutter/material.dart';

class ProfileItem {
  final String title;
  final IconData icon;
  final VoidCallback callback;
  final bool? hideIconNavigation;

  ProfileItem({
    required this.title,
    required this.icon,
    required this.callback,
    this.hideIconNavigation = false,
  });
}
