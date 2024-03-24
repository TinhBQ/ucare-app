import 'package:flutter/material.dart';

class CustomTextFieldProfile extends StatefulWidget {
  const CustomTextFieldProfile({
    super.key,
    required this.label,
    this.hint,
    required this.controller,
    this.content,
    this.disabled = false,
  });
  final String label;
  final String? hint;
  final TextEditingController controller;
  final String? content;
  final bool disabled;

  @override
  State<StatefulWidget> createState() => _CustomTextFieldProfile();
}

class _CustomTextFieldProfile extends State<CustomTextFieldProfile> {
  @override
  void initState() {
    super.initState();
    if (widget.content != null) {
      widget.controller.text = widget.content!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        enabled: !widget.disabled,
        controller: widget.controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: widget.hint,
          labelText: widget.label,
        ),
      ),
    );
  }
}
