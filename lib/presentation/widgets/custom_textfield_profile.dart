import 'package:flutter/material.dart';

class CustomTextFieldProfile extends StatefulWidget {
  const CustomTextFieldProfile({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });
  final String label;
  final String hint;
  final TextEditingController controller;

  @override
  State<StatefulWidget> createState() => _CustomTextFieldProfile();
}

class _CustomTextFieldProfile extends State<CustomTextFieldProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
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
