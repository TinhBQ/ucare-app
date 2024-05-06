part of 'widget_dependencies.dart';

class CustomCta extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool disable;
  final Color? background;

  const CustomCta({
    super.key,
    required this.title,
    required this.onTap,
    required this.disable,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    double buttonWidth = (screenWidth - 32);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0.0, 2.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Buttons Row
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: disable
                    ? null
                    : background ?? Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                title,
                style: disable
                    ? Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Theme.of(context).colorScheme.outline)
                    : Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
