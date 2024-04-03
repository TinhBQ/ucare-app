import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomNoData extends StatelessWidget {
  final String? text;
  const CustomNoData({
    super.key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text ?? 'Không có dữ liệu.',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: LottieBuilder.asset(
                    "assets/lottie/no-data-animation.json")),
          ],
        ),
      ),
    );
  }
}
