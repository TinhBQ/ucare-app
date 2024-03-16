import 'package:flutter/material.dart';

class ChooseOptionItem extends StatelessWidget {
  const ChooseOptionItem({
    super.key,
    required this.name,
    this.width,
    this.description,
  });

  final double? width;
  final String name;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.8,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(name,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          )),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Theme.of(context).colorScheme.tertiary,
                weight: 600,
              )
            ],
          ),
          const SizedBox(height: 4),
          if (description != null && description.toString().isNotEmpty)
            Text(description!,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    )),
        ],
      ),
    );
  }
}
