import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';

import 'patient_profile_detail_card.dart';

export 'patient_profile_details_list_card.dart';

class PatientProfileDetailsListCardWidget extends StatelessWidget {
  final List<PatientItem> patients;

  const PatientProfileDetailsListCardWidget({
    super.key,
    required this.onChoose,
    required this.patients,
  });

  final Function(PatientItem) onChoose;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return PatientProfileDetailCard(
            onChoose: () {
              onChoose(patients[index]);
            },
            first_name: patients[index].first_name,
            last_name: patients[index].last_name,
            phone: patients[index].phone,
          );
        },
      ),
    );
  }
}
