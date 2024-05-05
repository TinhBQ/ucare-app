import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

class MedicineScheduleSessionCard extends StatelessWidget {
  final MedicineSessionItem medicineSession;
  final void Function() onUpdateTime;
  final void Function(bool value) onChecked;

  const MedicineScheduleSessionCard({
    super.key,
    required this.medicineSession,
    required this.onUpdateTime,
    required this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  getIcon(medicineSession.icon),
                  size: 28,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  medicineSession.session,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    onUpdateTime();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      TimeOfDay(
                        hour: medicineSession.hour,
                        minute: medicineSession.minute,
                      ).format(context),
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Switch(
                  activeColor: Theme.of(context).colorScheme.onPrimary,
                  value: medicineSession.isActived == 1,
                  onChanged: (bool value) {
                    onChecked(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
