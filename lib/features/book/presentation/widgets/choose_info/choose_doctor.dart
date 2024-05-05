import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';

class ChooseDoctorWidget extends StatefulWidget {
  const ChooseDoctorWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ChooseDoctorWidgetState();
}

class _ChooseDoctorWidgetState extends State<ChooseDoctorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: const CustomSubAppBar(
        title: 'Chọn bác sĩ',
      ),
      body: Column(),
    );
  }
}
