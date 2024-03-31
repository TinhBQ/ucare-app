import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/presentation/widgets/widgets.dart';

class MedicineSessionsWidget extends StatelessWidget {
  const MedicineSessionsWidget({
    super.key,
    required this.medicineSessions,
  });
  final List<MedicineSessionItem> medicineSessions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ĐẶT GIỜ UỐNG THUỐC',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(
            height: 8,
          ),
          ...medicineSessions.map(
            (session) => MedicineSessionCardWidget(
              medicineSession: session,
            ),
          ),
        ],
      ),
    );
  }
}
