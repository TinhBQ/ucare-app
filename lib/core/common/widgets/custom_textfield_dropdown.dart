import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';

class CustomTextfieldDropdown extends StatefulWidget {
  const CustomTextfieldDropdown({
    super.key,
    required this.controller,
    required this.label,
    required this.listOption,
    this.content,
  });

  final TextEditingController controller;
  final String label;
  final List<String> listOption;
  final String? content;

  @override
  State<StatefulWidget> createState() => _CustomTextfieldDropdown();
}

class _CustomTextfieldDropdown extends State<CustomTextfieldDropdown> {
  void _openSelectValueDialog() async {
    final selectedValue = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomSelectValueDialog(
          onSelect: (value) => Navigator.pop(context, value),
          listOption: widget.listOption,
          title: widget.label,
        );
      },
    );
    if (selectedValue != null) {
      setState(() {
        widget.controller.text = selectedValue;
      });
    }
  }

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
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              readOnly: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _openSelectValueDialog();
                  },
                  icon: const Icon(Icons.arrow_drop_down),
                ),
                labelText: widget.label,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
