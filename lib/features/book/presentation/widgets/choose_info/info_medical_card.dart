import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';

class InfoMedicalCardWidget extends StatelessWidget {
  const InfoMedicalCardWidget({
    super.key,
    required this.infoMedicalItem,
  });

  final InfoMedicalItem infoMedicalItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: infoMedicalItem.onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
            ),
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    infoMedicalItem.icon,
                    size: 32,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    infoMedicalItem.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 20),
                  ),
                ],
              ),
              if (infoMedicalItem.iconRight != null)
                Icon(
                  infoMedicalItem.iconRight,
                  color: infoMedicalItem.iconRight == Icons.check_circle
                      ? Colors.green
                      : Theme.of(context).colorScheme.onBackground,
                )
            ],
          ),
        ),
      ),
    );
  }
}
