import 'package:flutter/material.dart';

class ProflieInkwellItemProfileWidget extends StatelessWidget {
  const ProflieInkwellItemProfileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.ontap,
    this.hideIconNavigation = false,
  });
  final IconData icon;
  final String title;
  final VoidCallback ontap;
  final bool? hideIconNavigation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: ontap,
      child: Container(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, right: 16, left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  icon,
                  size: 28,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ],
            ),
            Container(
              child: hideIconNavigation == true
                  ? null
                  : Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 22,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
