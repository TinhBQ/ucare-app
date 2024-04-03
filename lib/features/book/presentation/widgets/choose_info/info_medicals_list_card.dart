import 'package:flutter/material.dart';

import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class InfoMedicalsListCardWidget extends StatelessWidget {
  const InfoMedicalsListCardWidget({
    super.key,
    required this.listInfoMedicalItems,
    required this.numFlow,
  });
  final List<InfoMedicalItem> listInfoMedicalItems;
  final int numFlow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(children: [
        for (int index = 0; index < listInfoMedicalItems.length; index++)
          InfoMedicalCardWidget(
            infoMedicalItem: listInfoMedicalItems[index],
            disabled: index + 1 > numFlow ? true : false,
          ),
      ]),
    );
  }
}
