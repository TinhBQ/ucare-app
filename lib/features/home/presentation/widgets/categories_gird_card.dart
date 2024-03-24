import 'package:flutter/material.dart';

import 'category_card.dart';

class CategoriesGirdCardWidget extends StatelessWidget {
  const CategoriesGirdCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      childAspectRatio: (1 / .4),
      mainAxisSpacing: 16,
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      children: [
        CategoryCardWidget(
          title: 'Đặt khám',
          icon: Icons.local_hospital,
          onPressed: () {
            // Navigator.pushNamed(
            //     context, ChooseProflieScreen.routeName);
          },
        ),
        CategoryCardWidget(
          title: 'Lịch sử đặt khám',
          icon: Icons.file_copy_outlined,
          onPressed: () {
            print('object');
          },
        ),
        CategoryCardWidget(
          title: 'Đặt lịch uống thuốc',
          icon: Icons.medication_liquid,
          onPressed: () {
            print('object');
          },
        ),
        CategoryCardWidget(
          title: 'Theo dõi sức khỏe',
          icon: Icons.monitor_heart,
          onPressed: () {
            print('object');
          },
        ),
      ],
    );
  }
}
