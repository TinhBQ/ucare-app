import 'package:flutter/material.dart';

class SubAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const SubAppBarWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
