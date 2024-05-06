import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';

class ScheduleChooseDoctorExamDoctorItem extends StatelessWidget {
  final String? avatar;
  final String? sessionOfTime;
  final String? doctorName;
  final String? departmentName;
  final String? room;
  final String? day;

  final VoidCallback onTap;

  const ScheduleChooseDoctorExamDoctorItem({
    super.key,
    required this.avatar,
    required this.sessionOfTime,
    required this.doctorName,
    required this.departmentName,
    required this.room,
    required this.day,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).colorScheme.surfaceVariant,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: 1.8,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomImage(
                  imageUrl: avatar,
                  placeholderStr: 'assets/images/placeholder_doctor.jpg',
                  imageStr: 'assets/images/placeholder_doctor.jpg',
                  height: 118,
                  width: 111,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Column(
                      children: [
                        Text(
                          sessionOfTime ?? 'Chưa có lịch',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName?.toUpperCase() ?? "NO NAME",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      departmentName?.toUpperCase() ?? "NO DEPARTMENT",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      room ?? "No room",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                    Text(
                      day != null
                          ? 'Ngày ${UCARETimeZone.fDateInput(
                              day!,
                              inFM: DateStrFormat.DATEINPUT,
                              fm: DateStrFormat.DATE,
                            )}'
                          : "No day",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
