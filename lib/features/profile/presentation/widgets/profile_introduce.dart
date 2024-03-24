import 'package:flutter/material.dart';

class ProflieIntroduceWidget extends StatelessWidget {
  const ProflieIntroduceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currenPaddingTop = MediaQuery.of(context).padding.top;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background-profile.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(66),
          topRight: Radius.circular(66),
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(36),
        ),
      ),
      padding: EdgeInsets.only(
          left: 24, right: 24, top: 12 + currenPaddingTop, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 86,
            height: 86,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.shadow.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                  )
                ]),
            child: Image.asset(
              'assets/logo/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Cá nhân',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
