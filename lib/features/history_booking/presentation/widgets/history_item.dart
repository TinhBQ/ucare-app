import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';

class HistoryItemWidget extends StatelessWidget {
  final String? doctorName;
  final String? degree;
  final String? departmentName;
  final String? roomName;
  final String? sessionName;
  final String? day;
  final String? firstName;
  final String? lastName;

  const HistoryItemWidget({
    super.key,
    required this.doctorName,
    required this.degree,
    required this.roomName,
    required this.sessionName,
    required this.departmentName,
    required this.day,
    required this.firstName,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, top: 16, right: 24, bottom: 24),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.account_box_rounded),
            const SizedBox(width: 8),
            Text(
              '$degree $doctorName',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.headset_mic_outlined),
            const SizedBox(width: 8),
            Text(
              '$departmentName',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.business_outlined),
            const SizedBox(width: 8),
            Text(
              '$roomName',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.calendar_today),
            const SizedBox(width: 8),
            Text(
              '$day',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.access_time_outlined),
            const SizedBox(width: 8),
            Text(
              '$sessionName',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        const Divider(),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.medical_services_outlined),
            const SizedBox(width: 8),
            Text(
              '$lastName $firstName',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
