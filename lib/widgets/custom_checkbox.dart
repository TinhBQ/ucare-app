import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String description;
  final String descriptionInkwell;
  final bool checked;
  final Function(bool?)? onChanged;
  final VoidCallback onTap;

  const CustomCheckbox({super.key, required this.description, required this.checked, required this.onChanged, required this.descriptionInkwell, required this.onTap});
  
  @override
  State<StatefulWidget> createState() => _CustomCheckbox();

  
}

class _CustomCheckbox extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
      children: <Widget>[
          Checkbox(
            value: widget.checked,
            onChanged: widget.onChanged,
            activeColor: Theme.of(context).colorScheme.primary,
          ),
          Text(
            widget.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            ' ',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          InkWell(
            onTap: widget.onTap,
            child: Text(
              widget.descriptionInkwell,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
      ],
    ),
    );

  }
  
}