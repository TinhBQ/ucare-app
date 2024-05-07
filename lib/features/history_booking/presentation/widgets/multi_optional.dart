import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';

class MultiOptionalWidget extends StatefulWidget {
  final int currentStep;
  final Function(int, String) onStepSelected;
  final List<StatusItem> statusItems;

  const MultiOptionalWidget({
    super.key,
    required this.currentStep,
    required this.onStepSelected,
    required this.statusItems,
  });
  @override
  State<StatefulWidget> createState() => _MultiOptionalWidgetState();
}

class _MultiOptionalWidgetState extends State<MultiOptionalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.statusItems.length, (index) {
            final item = widget.statusItems[index];

            return GestureDetector(
              onTap: () {
                widget.onStepSelected(index, item.id);
              },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: widget.currentStep == index
                          ? FontWeight.bold
                          : FontWeight.bold,
                      color: widget.currentStep == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
