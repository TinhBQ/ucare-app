import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class ChooseDateMedicalPage extends StatelessWidget {
  final Function(DateTime) onDateMedicalPageSelected;
  const ChooseDateMedicalPage({
    super.key,
    required this.onDateMedicalPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomSubAppBar(
        title: 'Chọn ngày khám',
      ),
      body: Column(
        children: [
          PickerDateWidget(
            onSelected: (DateTime dateTime) {
              onDateMedicalPageSelected(dateTime);
            },
            strSelectedDate: '',
          ),
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
