import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class CustomSlideNews extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath;

  const CustomSlideNews(
      {super.key,
      required this.title,
      required this.content,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 2)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 9,
        ),
        Text(content,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).colorScheme.secondary)),
        const SizedBox(
          height: 12,
        ),
        Image(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          width: double.infinity,
          height: 100,
        ),
      ]),
    );
  }
}
