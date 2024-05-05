import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class ChooseTimeMedicalWidget extends StatefulWidget {
  const ChooseTimeMedicalWidget({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ChooseTimeMedicalWidgetState();
}

class _ChooseTimeMedicalWidgetState extends State<ChooseTimeMedicalWidget> {
  final List<String> listTimeMorning = [
    '6:00 - 7:00',
    '7:00 - 8:00',
    '8:00 - 9:00',
    '9:00 - 10:00',
    '10:00 - 11:00',
  ];
  final List<String> listTimeAfternoon = [
    '13:00 - 14:00',
    '14:00 - 15:00',
    '15:00 - 16:00',
    '16:00 - 17:00',
  ];

  late List<TimeMedicalCardWidget> listTimeMedicalWidgets = [];
  @override
  void initState() {
    super.initState();
    listTimeMedicalWidgets = [
      TimeMedicalCardWidget(
        doctor: 'Trinh Phan',
        room: "Phòng 2 - lầu 3",
        session: 'Buổi sáng',
        listTimes: listTimeMorning,
      ),
      TimeMedicalCardWidget(
        doctor: 'Trinh Phan',
        room: "Phòng 2 - lầu 3",
        session: 'Buổi sáng',
        listTimes: listTimeMorning,
      ),
      TimeMedicalCardWidget(
        doctor: 'Trinh Phan',
        room: "Phòng 2 - lầu 3",
        session: 'Buổi sáng',
        listTimes: listTimeMorning,
      ),
      TimeMedicalCardWidget(
        doctor: 'Trinh Phan',
        room: "Phòng 2 - lầu 3",
        session: 'Buổi sáng',
        listTimes: listTimeMorning,
      ),
      TimeMedicalCardWidget(
        doctor: 'Trinh Phan',
        room: "Phòng 2 - lầu 3",
        session: 'Buổi sáng',
        listTimes: listTimeMorning,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: const CustomSubAppBar(
        title: 'Chọn giờ khám',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listTimeMedicalWidgets.length,
          itemBuilder: (context, index) => listTimeMedicalWidgets[index],
        ),
      ),
    );
  }
}
