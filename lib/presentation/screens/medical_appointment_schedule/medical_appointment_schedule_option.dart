import 'package:flutter/material.dart';

class MedicalAppointmentScheduleOption extends StatelessWidget {
  const MedicalAppointmentScheduleOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.width,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final double width;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).colorScheme.surfaceVariant,
      child: Container(
        width: width,
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.only(top: 8, left: 16, right: 8, bottom: 8),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.outline,
            ),
            bottom: BorderSide(
                width: 1, color: Theme.of(context).colorScheme.outline),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
            const SizedBox(height: 4),
            Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(subtitle,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              )),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_right_outlined)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
