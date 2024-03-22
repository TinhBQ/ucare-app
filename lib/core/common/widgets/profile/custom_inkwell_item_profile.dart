import 'package:flutter/material.dart';

class CustomInkwellItemProfile extends StatelessWidget {
  const CustomInkwellItemProfile({
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
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ],
          ),
          Container(
            child: hideIconNavigation == true
                ? null
                : Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
          )
        ],
      ),
    );
  }
}
