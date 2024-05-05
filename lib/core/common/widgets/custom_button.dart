part of 'widget_dependencies.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final bool disabled;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.disabled = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: widget.disabled ? null : widget.onPressed,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                widget.title,
                style: widget.disabled
                    ? Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Theme.of(context).colorScheme.outline)
                    : Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
