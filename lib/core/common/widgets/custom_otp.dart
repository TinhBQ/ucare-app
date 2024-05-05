part of 'widget_dependencies.dart';

class CustomOTP extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String) onChanged;

  const CustomOTP({
    super.key,
    required this.label,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Pinput(
          onChanged: onChanged,
          controller: controller,
          length: 6,
          autofocus: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          defaultPinTheme: PinTheme(
              height: currentWidth / 6,
              width: currentWidth / 6,
              textStyle: Theme.of(context).textTheme.bodyLarge,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  )))),
    );
  }
}
