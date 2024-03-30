import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:shimmer/shimmer.dart';

import 'doctor_item.dart';

class DoctorListItemWidget extends StatelessWidget {
  final bool isLoading;
  final bool isFirstLoading;
  final List<DoctorItem?> listDoctorItem;

  const DoctorListItemWidget({
    super.key,
    this.isLoading = false,
    this.isFirstLoading = true,
    required this.listDoctorItem,
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
                (_) => const DoctorItemWidget(
                  avatar: null,
                  sessionOfTime: null,
                  doctorName: null,
                  departmentName: null,
                  description: null,
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
          ...listDoctorItem.map(
            (item) => DoctorItemWidget(
              avatar: item?.avatar,
              sessionOfTime: item?.session_of_day.content,
              doctorName: item?.name,
              departmentName: item?.department.name,
              description: item?.description,
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
