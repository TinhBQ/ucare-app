import 'package:flutter/material.dart';

class MultiOptionalWidget extends StatefulWidget {
  final int currentStep;
  final Function(int) onStepSelected;

  const MultiOptionalWidget({
    super.key,
    required this.currentStep,
    required this.onStepSelected,
  });
  @override
  State<StatefulWidget> createState() => _MultiOptionalWidgetState();
}

class _MultiOptionalWidgetState extends State<MultiOptionalWidget> {
  List<String> listLabels = [
    'Đã thanh toán',
    'Đã tiếp nhận',
    'Đã khám',
    'Đã hủy'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondaryContainer),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(listLabels.length, (index) {
            final label = listLabels[index];
            return GestureDetector(
              onTap: () {
                widget.onStepSelected(index);
              },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                          widget.currentStep == index ? FontWeight.bold : null,
                      color: widget.currentStep == index
                          ? Theme.of(context).colorScheme.primary
                          : Colors.black,
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
