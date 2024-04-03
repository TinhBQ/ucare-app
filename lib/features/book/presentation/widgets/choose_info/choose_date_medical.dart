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
      appBar: const SubAppBarWidget(
        title: 'Chọn ngày khám',
      ),
      body: Column(
        children: [
          PickerDateWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.square,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text('Ngày có thể chọn')
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.square,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text('Ngày ngoài vùng đăng ký khám')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
