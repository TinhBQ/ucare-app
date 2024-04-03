import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class ChooseDateMedicalWidget extends StatefulWidget {
  const ChooseDateMedicalWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ChooseDateMedicalWidgetState();
}

class _ChooseDateMedicalWidgetState extends State<ChooseDateMedicalWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: const SubAppBarWidget(
        title: 'Chọn ngày khám',
      ),
      body: Column(
        children: [
          PickerDateWidget(),
        ],
      ),
    );
  }
}
