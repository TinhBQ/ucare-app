part of 'widget_dependencies.dart';

class CustomCheckbox extends StatefulWidget {
  final String description;
  final bool checked;
  final Function(bool?)? onChanged;
  final String? descriptionInkwell;
  final VoidCallback? onTap;

  const CustomCheckbox({
    super.key,
    required this.description,
    required this.checked,
    required this.onChanged,
    this.descriptionInkwell = '',
    this.onTap,
  });

  @override
  State<StatefulWidget> createState() => _CustomCheckbox();
}

class _CustomCheckbox extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: widget.checked,
            onChanged: widget.onChanged,
            activeColor: Theme.of(context).colorScheme.primary,
          ),
          Text(
            widget.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          if (widget.descriptionInkwell!.isNotEmpty)
            Text(
              ' ',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          InkWell(
            onTap: widget.descriptionInkwell!.isNotEmpty ? widget.onTap! : null,
            child: Text(
              widget.descriptionInkwell!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
