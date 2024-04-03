import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class InfoMedicalsListCardWidget extends StatelessWidget {
  const InfoMedicalsListCardWidget({
    super.key,
    required this.listInfoMedicalItems,
  });
  final List<InfoMedicalItem> listInfoMedicalItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          ...listInfoMedicalItems.map(
            (infoMedicalItem) => InfoMedicalCardWidget(
              infoMedicalItem: infoMedicalItem,
            ),
          ),
        ],
      ),
    );
  }
}
