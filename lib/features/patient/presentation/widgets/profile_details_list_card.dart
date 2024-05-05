import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';

import 'profile_detail_card.dart';

class ProfileDetailsListCardWidget extends StatelessWidget {
  final List<PatientItem> patients;

  const ProfileDetailsListCardWidget({
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
          return ProfileDetailCard(
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
