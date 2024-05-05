import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/medicine_schedule/presentation/bloc/medicine_schedule_bloc.dart';

import 'medicine_schedule_session_card.dart';

class MedicineScheduleSessions extends StatefulWidget {
  final List<MedicineSessionItem> medicineSessions;

  const MedicineScheduleSessions({
    super.key,
    required this.medicineSessions,
  });

  @override
  State<MedicineScheduleSessions> createState() =>
      _MedicineSessionsWidgetState();
}

class _MedicineSessionsWidgetState extends State<MedicineScheduleSessions> {
  Future<TimeOfDay?> _selectTime(BuildContext context, TimeOfDay time) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time) {
      return picked;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    void update(TimeOfDay timeOfDay, MedicineSessionItem item) async {
      context.read<MedicineScheduleBloc>().add(
            MedicineScheduleUpdateTime(
                item: item.copyWith(
              hour: timeOfDay.hour,
              minute: timeOfDay.minute,
            )),
          );
    }

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
          ...widget.medicineSessions.map(
            (session) => MedicineScheduleSessionCard(
              medicineSession: session,
              onUpdateTime: () async {
                TimeOfDay? timeOfDay = await _selectTime(
                  context,
                  TimeOfDay(
                    hour: session.hour,
                    minute: session.minute,
                  ),
                );

                if (timeOfDay != null) {
                  update(timeOfDay, session);
                }
              },
              onChecked: (bool value) {
                context.read<MedicineScheduleBloc>().add(
                      MedicineScheduleChecked(
                          item: session.copyWith(
                        isActived: value == true ? 1 : 0,
                      )),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
