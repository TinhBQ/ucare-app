import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';

class HomeIntroduce extends StatelessWidget {
  final String? avatar;
  final String email;

  const HomeIntroduce({
    super.key,
    required this.avatar,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final currenPaddingTop = MediaQuery.of(context).padding.top;

    print('Trinh123@@ $avatar');

    Widget image = (avatar == null ||
            avatar?.toUpperCase() == 'String'.toUpperCase() ||
            avatar == '')
        ? const CustomImage(
            imageUrl: null,
            placeholderStr: 'assets/logo/no-image.png',
            imageStr: 'assets/logo/no-image.png',
            height: 78,
            width: 78,
          )
        : CustomImage(
            imageUrl:
                'https://mobile-advanced-be-r7xe.onrender.com/v1.0/api/files/image/$avatar',
            placeholderStr: 'assets/logo/no-image.png',
            imageStr: 'assets/logo/no-image.png',
            height: 78,
            width: 78,
          );
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal, Colors.yellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      padding:
          EdgeInsets.only(left: 16, top: 24 + currenPaddingTop, bottom: 24),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.onTertiary,
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9999),
              child: image,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Chào mừng đến với ',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    TextSpan(
                      text: 'U Care',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                email,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
