import 'package:flutter/material.dart';

class CustomCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomCategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(color: Theme.of(context).colorScheme.primary)),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(children: [
          Icon(icon, color: Colors.red,),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 1,
            child: Text(
              title,
              softWrap: true,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ]),
      ),
    );
  }
}
