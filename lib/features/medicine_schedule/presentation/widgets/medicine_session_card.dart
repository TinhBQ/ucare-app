import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';

class MedicineSessionCardWidget extends StatefulWidget {
  const MedicineSessionCardWidget({
    super.key,
    required this.medicineSession,
  });

  final MedicineSessionItem medicineSession;

  @override
  State<StatefulWidget> createState() => _MedicineSessionCardWidgetState();
}

class _MedicineSessionCardWidgetState extends State<MedicineSessionCardWidget> {
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
                  widget.medicineSession.icon,
                  size: 28,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.medicineSession.session,
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
                  onTap: widget.medicineSession.onChangedTime,
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
                              hour: widget.medicineSession.time.hour,
                              minute: widget.medicineSession.time.minute)
                          .format(context),
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
                  value: widget.medicineSession.isActived,
                  onChanged: widget.medicineSession.onChangedActive,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
