import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class PatientProfilesListCardWidget extends StatelessWidget {
  const PatientProfilesListCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
          height: 92,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3, // độ dài list profile + 1
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CreateProfileWidget(),
                      ),
                    );
                  }, // hàm thêm
                  child: Container(
                    width: 92,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 32,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Text(
                          'Thêm',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const ProfileCardWidget();
              }
            },
          )),
    );
  }
}
