part of 'widget_dependencies.dart';

class CustomTextfieldPassword extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Function(String) onChanged;
  final bool disabled;

  const CustomTextfieldPassword({
    super.key,
    required this.label,
    required this.controller,
    required this.onChanged,
    this.disabled = false,
  });

  @override
  State<StatefulWidget> createState() => _CustomTextfieldPasswordState();
}

class _CustomTextfieldPasswordState extends State<CustomTextfieldPassword> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _passwordVisible,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          labelText: widget.label,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        onChanged: widget.onChanged,
        enabled: !widget.disabled,
      ),
    );
  }
}
