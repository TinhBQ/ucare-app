import 'package:flutter/material.dart';

class CustomButtonSemiRow extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomButtonSemiRow(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(vertical: 24),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
