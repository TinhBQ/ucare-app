import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_advanced_project_fe/global.dart';

class CustomTextfieldDatetime extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final DateTime? content;
  final TextStyle? labelStyle;
  final Function(String)? onChanged;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool isValid;

  const CustomTextfieldDatetime({
    super.key,
    required this.label,
    required this.controller,
    this.content,
    this.labelStyle,
    this.onChanged,
    this.firstDate,
    this.lastDate,
    this.isValid = false,
  });

  @override
  State<StatefulWidget> createState() => _CustomTextfieldDatetimeState();
}

class _CustomTextfieldDatetimeState extends State<CustomTextfieldDatetime> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: widget.firstDate ?? DateTime(DateTime.now().year - 120),
      lastDate: widget.lastDate ?? DateTime.now(),
    );
    if ((picked != null && picked != selectedDate) || widget.isValid) {
      setState(() {
        selectedDate = picked ?? DateTime.now();
        widget.controller.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.content != null) {
      widget.controller.text = DateFormat('dd-MM-yyyy').format(widget.content!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.label,
          labelStyle: widget.labelStyle,
          suffixIcon: IconButton(
            onPressed: () => _selectDate(context),
            icon: const Icon(Icons.calendar_today),
          ),
        ),
        readOnly: true,
      ),
    );
  }
}
