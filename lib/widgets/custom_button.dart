import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool disabled;

  const CustomButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: disabled ? null : onPressed,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                title,
                style: disabled
                    ? Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Theme.of(context).colorScheme.outline)
                    : Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
