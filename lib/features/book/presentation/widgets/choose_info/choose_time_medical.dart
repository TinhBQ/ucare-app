import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class ChooseTimeMedicalWidget extends StatefulWidget {
  const ChooseTimeMedicalWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ChooseTimeMedicalWidgetState();
}

class _ChooseTimeMedicalWidgetState extends State<ChooseTimeMedicalWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: const SubAppBarWidget(
        title: 'Chọn giờ khám',
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
