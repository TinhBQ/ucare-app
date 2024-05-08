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
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
      ),
      child: IconStepper(
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
                    ? Theme.of(context).colorScheme.onTertiary
                    : Theme.of(context).colorScheme.onTertiaryContainer,
              ),
            )
            .toList(),
        activeStep: widget.currentStep,
        lineColor: Colors.white,
        activeStepBorderColor: Theme.of(context).colorScheme.tertiaryContainer,
        activeStepColor: Theme.of(context).colorScheme.tertiary,
        stepColor: Theme.of(context).colorScheme.surfaceVariant,
        activeStepBorderWidth: 8,
        activeStepBorderPadding: 0,
        stepReachedAnimationEffect: Curves.linear,
      ),
    );
  }
}
