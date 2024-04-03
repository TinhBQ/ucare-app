import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/widgets/multi_optional.dart';
import 'package:mobile_advanced_project_fe/features/history_booking/presentation/widgets/widgets.dart';

class HistoryBookPage extends StatefulWidget {
  const HistoryBookPage({super.key});

  @override
  State<StatefulWidget> createState() => _HistoryBookPageState();
}

class _HistoryBookPageState extends State<HistoryBookPage> {
  int _currentStep = 0;
  List<String> listTitleSteps = [
    'Đã thanh toán',
    'Đã tiếp nhận',
    'Đã khám',
    'Đã hủy'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Phiếu khám bệnh',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MultiOptionalWidget(
            currentStep: _currentStep,
            onStepSelected: (int step) {
              setState(() {
                _currentStep = step;
              });
            },
          ),
          const SizedBox(height: 20),
          const HistoryItemWidget(
            day: "My Trần",
            doctorName: "My Trần",
            departmentName: "My",
            degree: "My Trần",
            firstName: "My Trần",
            lastName: "My Trần",
            roomName: "My Trần",
            sessionName: "My Trần",
            statusName: "My Trần",
          )
        ],
      ),
    );
  }
}
