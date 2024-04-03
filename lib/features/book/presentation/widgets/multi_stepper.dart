import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class MultiStepperWidget extends StatefulWidget {
  const MultiStepperWidget({
    super.key,
    required this.currentStep,
  });
  final int currentStep;
  @override
  State<StatefulWidget> createState() => _MultiStepperWidgetState();
}

class _MultiStepperWidgetState extends State<MultiStepperWidget> {
  List<IconData> listIcons = [
    Icons.person_outline,
    Icons.local_hospital_outlined,
    Icons.list_alt_outlined,
    Icons.wallet_outlined,
    Icons.receipt_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    return IconStepper(
      stepReachedAnimationDuration: const Duration(microseconds: 1),
      enableNextPreviousButtons: false,
      enableStepTapping: false,
      lineLength: 28,
      icons: listIcons
          .asMap()
          .entries
          .map(
            (entry) => Icon(
              entry.value,
              weight: 50,
              color: widget.currentStep == entry.key
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          )
          .toList(),
      activeStep: widget.currentStep,
      lineColor: Theme.of(context).colorScheme.secondary,
      activeStepBorderColor: Theme.of(context).colorScheme.primaryContainer,
      activeStepColor: Theme.of(context).colorScheme.primary,
      stepColor: Theme.of(context).colorScheme.surfaceVariant,
      activeStepBorderWidth: 8,
      activeStepBorderPadding: 0,
      stepReachedAnimationEffect: Curves.linear,
    );
  }
}
