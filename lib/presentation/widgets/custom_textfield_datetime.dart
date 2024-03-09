import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextfieldDatetime extends StatefulWidget {
  const CustomTextfieldDatetime({
    super.key,
    required this.label,
    required this.controller,
  });
  final String label;
  final TextEditingController controller;

  @override
  State<StatefulWidget> createState() => _CustomTextfieldDatetimeState();
}

class _CustomTextfieldDatetimeState extends State<CustomTextfieldDatetime> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.controller.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
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
          labelText: 'Select Date',
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
