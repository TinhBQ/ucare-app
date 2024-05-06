part of 'widget_dependencies.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.iconAction,
    this.onPressed,
    this.background,
    this.color,
  });

  final String title;
  final IconData? iconAction;
  final VoidCallback? onPressed;
  final Color? background;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: background ?? Theme.of(context).colorScheme.background,
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: color ?? Colors.black,
              fontWeight: FontWeight.bold,
            ),
      ),
      iconTheme: IconThemeData(
        color: color ?? Colors.black,
      ),
      centerTitle: true,
      actions: iconAction != null
          ? <Widget>[
              IconButton(
                icon: Icon(
                  iconAction,
                  color: color ?? Colors.black,
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
