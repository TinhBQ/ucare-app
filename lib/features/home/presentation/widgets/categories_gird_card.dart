import 'package:flutter/material.dart';

import 'category_card.dart';

class CategoryCardItem {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  CategoryCardItem(
      {required this.title, required this.icon, required this.onPressed});
}

List<CategoryCardItem> listCategoryCardItem = [
  CategoryCardItem(
    title: 'Đặt khám',
    icon: Icons.local_hospital,
    onPressed: () {},
  ),
  CategoryCardItem(
    title: 'Đặt khám',
    icon: Icons.local_hospital,
    onPressed: () {},
  ),
  CategoryCardItem(
    title: 'Đặt lịch uống thuốc',
    icon: Icons.medication_liquid,
    onPressed: () {},
  ),
  CategoryCardItem(
    title: 'Theo dõi sức khỏe',
    icon: Icons.monitor_heart,
    onPressed: () {},
  ),
  CategoryCardItem(
    title: 'Theo dõi sức khỏe',
    icon: Icons.monitor_heart,
    onPressed: () {},
  ),
  CategoryCardItem(
    title: 'Theo dõi sức khỏe',
    icon: Icons.monitor_heart,
    onPressed: () {},
  )
];

class CategoriesGirdCardWidget extends StatelessWidget {
  const CategoriesGirdCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
            List.generate((listCategoryCardItem.length / 2).ceil(), (index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...listCategoryCardItem.skip(index * 2).take(2).map((item) {
                  return CategoryCardWidget(
                    title: item.title,
                    icon: item.icon,
                    onPressed: item.onPressed,
                  );
                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
