import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final Function(String) onChanged;


  const CustomTextfield({super.key, required this.label, required this.icon, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon),
          suffixIcon: IconButton(
            onPressed: controller.clear,
            icon: const Icon(Icons.clear),
          ),
          labelText: label,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        onChanged: onChanged,
      ),
    );
  }
  
}