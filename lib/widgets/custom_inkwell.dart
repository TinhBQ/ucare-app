import 'package:flutter/material.dart';

class CustomInkwell extends StatelessWidget {
  final String description;
  final String descriptionInkwell;
  final VoidCallback onTap;
  final TextStyle textStyle;

  const CustomInkwell({super.key, required this.description, required this.onTap, required this.descriptionInkwell, required this.textStyle});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            description,
            style: textStyle,
          ),
          Text(
            ' ',
            style: textStyle,
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              descriptionInkwell,
              style: textStyle.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          )
        ],
      ),
    );
  }
  
}