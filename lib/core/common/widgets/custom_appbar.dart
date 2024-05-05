part of 'widget_dependencies.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.iconAction,
    this.onPressed,
  });

  final String title;
  final IconData? iconAction;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.onBackground,
      ),
      centerTitle: true,
      actions: iconAction != null
          ? <Widget>[
              IconButton(
                icon: Icon(
                  iconAction,
                  color: Colors.black,
                ), // Icon bạn muốn thêm
                onPressed: onPressed,
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
