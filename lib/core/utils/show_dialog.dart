part of 'utils_dependencies.dart';

class ShowDialog {
  static void confirm(
    BuildContext context, {
    required String title,
    String? description,
    required VoidCallback callback,
  }) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: Text(title),
          content: description != null ? Text(description) : null,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                callback();
              },
              child: const Text('Đồng ý'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(title),
          content: description != null ? Text(description) : null,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                callback();
              },
              child: const Text('Đồng ý'),
            ),
          ],
        ),
      );
    }
  }
}
