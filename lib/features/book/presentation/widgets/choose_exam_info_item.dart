import 'package:flutter/material.dart';

class ChooseExamInfoItem extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final String title;
  final bool disable;
  final String value;

  const ChooseExamInfoItem({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
    required this.disable,
    this.value = '',
  });

  @override
  Widget build(BuildContext context) {
    Widget iconRight = value.isEmpty
        ? Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Theme.of(context).colorScheme.onBackground,
          )
        : const Icon(
            Icons.check_circle,
            color: Colors.green,
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: disable ? null : onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: disable
                  ? Theme.of(context).colorScheme.outline
                  : Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
            color: disable
                ? Theme.of(context).colorScheme.onBackground.withOpacity(0.2)
                : Theme.of(context).colorScheme.background,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 32,
                    color: disable
                        ? Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.68)
                        : Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    value.isEmpty ? title : value,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 20,
                          color: disable
                              ? Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.68)
                              : Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              iconRight
            ],
          ),
        ),
      ),
    );
  }
}
