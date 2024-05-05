import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';

import 'schedule_choose_doctor_exam_item.dart';

class ScheduleChooseDoctorExamDoctorListItem extends StatelessWidget {
  final bool isLoading;
  final bool isFirstLoading;
  final List<ScheduleItem?> listScheduleItem;

  final Function(ScheduleItem) onChooseScheduleItem;

  const ScheduleChooseDoctorExamDoctorListItem({
    super.key,
    this.isLoading = false,
    this.isFirstLoading = true,
    required this.listScheduleItem,
    required this.onChooseScheduleItem,
  });

  @override
  Widget build(BuildContext context) {
    if (isFirstLoading) {
      return Container(
        padding:
            const EdgeInsets.only(top: 16, right: 20, left: 20, bottom: 16),
        child: Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
          highlightColor:
              Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
          child: Column(
            children: [
              ...List.generate(
                10,
                (_) => ScheduleChooseDoctorExamDoctorItem(
                  avatar: null,
                  sessionOfTime: null,
                  doctorName: null,
                  departmentName: null,
                  room: null,
                  day: null,
                  onTap: () {
                    //
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.only(top: 8, right: 20, left: 20, bottom: 16),
      child: Column(
        children: [
          ...listScheduleItem.map(
            (item) => ScheduleChooseDoctorExamDoctorItem(
              avatar: null,
              sessionOfTime: item?.session.content,
              doctorName: item?.doctor.name,
              departmentName: item?.department.name,
              room: item?.room.name,
              day: item?.day,
              onTap: () {
                onChooseScheduleItem(item!);
              },
            ),
          ),
          if (isLoading)
            Container(
              padding: const EdgeInsets.only(bottom: 16),
              child: const Center(
                child: CustomCircularProgressinDicator(),
              ),
            )
        ],
      ),
    );
  }
}
