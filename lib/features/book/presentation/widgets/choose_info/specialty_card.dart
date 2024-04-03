import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';

class SpecialtyCardWidget extends StatelessWidget {
  const SpecialtyCardWidget({
    super.key,
    required this.specialtyItem,
    required this.onPressed,
  });

  final SpecialtyItem specialtyItem;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      specialtyItem.title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 20,
                          ),
                      overflow: TextOverflow.visible,
                      maxLines: null,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${specialtyItem.price}đ',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 28,
                      ),
                    ],
                  ),
                ],
              ),
              if (specialtyItem.description != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '(${specialtyItem.description})',
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.visible,
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
