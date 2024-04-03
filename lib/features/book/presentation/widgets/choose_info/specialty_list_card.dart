import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class SpecialtyListCardWidget extends StatelessWidget {
  const SpecialtyListCardWidget({
    super.key,
    required this.specialtyItems,
    required this.onPressed,
  });
  final List<SpecialtyItem> specialtyItems;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        scrollDirection: Axis.vertical,
        itemCount: specialtyItems.length, //độ dài list chuyên khoa
        itemBuilder: (context, index) => SpecialtyCardWidget(
          specialtyItem: specialtyItems[index],
          onPressed: onPressed,
        ),
      ),
    );
  }
}
