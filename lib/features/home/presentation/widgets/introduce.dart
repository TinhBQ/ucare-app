import 'package:flutter/material.dart';

class IntroduceWidget extends StatelessWidget {
  final String avatar;
  final String email;
  const IntroduceWidget({
    super.key,
    required this.avatar,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final currenPaddingTop = MediaQuery.of(context).padding.top;
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
      padding: EdgeInsets.only(
          left: 20, right: 20, top: 24 + currenPaddingTop, bottom: 24),
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
            child: CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(avatar),
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
