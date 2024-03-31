import 'package:flutter/material.dart';

class ChooseSessionOfDayItemWidget extends StatelessWidget {
  final String content;
  final VoidCallback onClick;

  const ChooseSessionOfDayItemWidget({
    super.key,
    required this.content,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          onClick();
        },
        borderRadius: BorderRadius.circular(8.0),
        splashColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
        highlightColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        child: Container(
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          padding:
              const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
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
                      child: Text(content,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
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
            ],
          ),
        ),
      ),
    );
  }
}
