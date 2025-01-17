import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';

class HomeSlideNews extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath;

  const HomeSlideNews({
    super.key,
    required this.title,
    required this.content,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            content,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: CustomImage(
              imageUrl: imagePath,
              placeholderStr: 'assets/images/placeholder_doctor.jpg',
              imageStr: 'assets/images/placeholder_doctor.jpg',
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
