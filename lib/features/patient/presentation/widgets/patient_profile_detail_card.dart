// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class PatientProfileDetailCard extends StatelessWidget {
  final String first_name;
  final String last_name;
  final String phone;
  final VoidCallback? onChoose;
  final String email;

  const PatientProfileDetailCard({
    super.key,
    this.onChoose,
    required this.first_name,
    required this.last_name,
    required this.phone,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChoose,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.tertiary,
            width: 1.8,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      child: Icon(
                        Icons.info,
                        size: 26,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '$first_name $last_name',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 18,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.3),
                  ),
                  child: Icon(
                    Icons.phone_android_outlined,
                    size: 20,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  phone,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.3),
                  ),
                  child: Icon(
                    Icons.email,
                    size: 20,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  email,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
