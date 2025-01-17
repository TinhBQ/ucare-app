import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';

import 'home_category_card.dart';

class CategoryCardItem {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  CategoryCardItem(
      {required this.title, required this.icon, required this.onPressed});
}

// List<CategoryCardItem> listCategoryCardItem =

List<CategoryCardItem> getCategoryCardItems(BuildContext context) => [
      CategoryCardItem(
        title: 'Đặt khám',
        icon: Icons.local_hospital,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.BOOK_BY_SPECIALTY);
        },
      ),
      CategoryCardItem(
        title: 'Lịch sử Đặt khám',
        icon: Icons.local_hospital,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.HISTORY_BOOK);
        },
      ),
      CategoryCardItem(
        title: 'Đặt lịch uống thuốc',
        icon: Icons.medication_liquid,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.MEDICINE_SCHEDULE);
        },
      ),
      CategoryCardItem(
        title: 'Hồ sơ người bệnh',
        icon: Icons.people,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.PATIENT_PROFILES);
        },
      ),
      CategoryCardItem(
        title: 'Lịch sử thanh toán',
        icon: Icons.monitor_heart,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.PAYMENT_HISTORY);
        },
      ),
      CategoryCardItem(
        title: 'Thống kê',
        icon: Icons.bar_chart_rounded,
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.STATISTIC);
        },
      ),
    ];

class HomeCategoriesGirdCard extends StatelessWidget {
  const HomeCategoriesGirdCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(
            (getCategoryCardItems(context).length / 2).ceil(), (index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...getCategoryCardItems(context)
                    .skip(index * 2)
                    .take(2)
                    .map((item) {
                  return HomeCategoryCard(
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
