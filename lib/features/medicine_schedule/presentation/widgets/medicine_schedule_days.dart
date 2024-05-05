import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';

import 'medicine_schedule_day_card.dart';

class MedicineScheduleDays extends StatelessWidget {
  const MedicineScheduleDays({
    super.key,
    required this.medicineDays,
  });
  final List<MedicineDayItem> medicineDays;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ĐẶT NGÀY UỐNG THUỐC',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          ...medicineDays.map(
            (day) => MedicineScheduleDayCard(
              medicineDay: day,
            ),
          ),
        ],
      ),
    );
  }
}
