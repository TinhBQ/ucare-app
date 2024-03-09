import 'package:flutter/material.dart';

class CustomSelectValueDialog extends StatelessWidget {
  const CustomSelectValueDialog({
    super.key,
    required this.onSelect,
    required this.listOption,
    required this.title,
  });
  final Function(String) onSelect;
  final List<String> listOption;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(title),
      children: listOption.map((option) {
        return SimpleDialogOption(
          onPressed: () {
            // Chọn giá trị và đóng dialog
            onSelect(option);
          },
          child: Text(option),
        );
      }).toList(),
    );
  }
}
