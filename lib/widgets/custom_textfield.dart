import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final Function(String) onChanged;
  final String? content;
  final bool disabled;

  const CustomTextfield(
      {super.key,
      required this.label,
      required this.icon,
      required this.controller,
      required this.onChanged,
      this.content,
      this.disabled = false});

  @override
  State<StatefulWidget> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextfield> {
  bool _showClearIcon = false;
  @override
  void initState() {
    super.initState();
    // if (widget.content != null) {
    //   widget.controller.text = widget.content!;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: widget.controller,
        enabled: !widget.disabled,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: Icon(widget.icon),
          suffixIcon: _showClearIcon
              ? IconButton(
                  onPressed: () {
                    widget.controller.clear();
                    setState(() {
                      _showClearIcon = false;
                    });
                  },
                  icon: const Icon(Icons.clear),
                )
              : null,
          labelText: widget.label,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
