import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class TimeMedicalCardWidget extends StatelessWidget {
  const TimeMedicalCardWidget({
    super.key,
    required this.doctor,
    required this.room,
    required this.session,
    required this.listTimes,
  });
  final String doctor;
  final String room;
  final String session;
  final List<String> listTimes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.medical_services_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  doctor,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.room_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  room,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Divider(
                thickness: 1,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  session,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            ...List.generate(3.ceil(), (index) {
              return Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...listTimes.skip(index * 2).take(2).map((time) {
                      return TimeCardWidget(
                        time: time,
                      );
                    })
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
