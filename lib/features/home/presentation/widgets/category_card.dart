import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const CategoryCardWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return SizedBox(
      width: sizeScreen.width / 2 - 28,
      height: 78,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.7,
            ),
          ),
          shadowColor: Theme.of(context).colorScheme.shadow,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(children: [
          Icon(
            icon,
            color: Colors.red,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 1,
            child: Text(
              title,
              softWrap: true,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ]),
      ),
    );
  }
}
