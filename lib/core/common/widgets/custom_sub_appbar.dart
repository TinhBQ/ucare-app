part of 'widget_dependencies.dart';

class CustomSubAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSubAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 1,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onTertiaryContainer,
              fontWeight: FontWeight.bold,
            ),
      ),
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
