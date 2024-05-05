part of 'widget_dependencies.dart';

class CustomTextfieldDatetime extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final TextStyle? labelStyle;
  final Function(String)? onChanged;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool isValid;
  final VoidCallback? onChange;

  const CustomTextfieldDatetime({
    super.key,
    required this.label,
    required this.controller,
    this.labelStyle,
    this.onChanged,
    this.firstDate,
    this.lastDate,
    this.isValid = false,
    this.onChange,
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
        widget.onChange?.call();
        selectedDate = picked ?? DateTime.now();
        widget.controller.text =
            UCARETimeZone.fDate(selectedDate, fm: 'yyyy-MM-dd');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: TextFormField(
        onTap: () {
          _selectDate(
              context); // Hiển thị DatePicker khi người dùng chạm vào TextField
        },
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
