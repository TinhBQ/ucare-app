part of 'widget_dependencies.dart';

class CustomTextfieldDropdown extends StatefulWidget {
  const CustomTextfieldDropdown({
    super.key,
    required this.controller,
    required this.label,
    required this.listOption,
    this.content,
    this.onChanged,
    this.labelStyle,
    this.disabled = false,
  });

  final TextEditingController controller;
  final String label;
  final List<String> listOption;
  final String? content;
  final Function(String)? onChanged;
  final TextStyle? labelStyle;
  final bool disabled;

  @override
  State<StatefulWidget> createState() => _CustomTextfieldDropdown();
}

class _CustomTextfieldDropdown extends State<CustomTextfieldDropdown> {
  @override
  void initState() {
    super.initState();
    if (widget.content != null) {
      widget.controller.text = widget.content!;
    }
  }

  @override
  Widget build(BuildContext context) {
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
          widget.onChanged?.call(selectedValue);
          widget.controller.text = selectedValue;
        });
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onTap: () {
                _openSelectValueDialog();
              },
              enabled: !widget.disabled,
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
                labelStyle: widget.labelStyle,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
