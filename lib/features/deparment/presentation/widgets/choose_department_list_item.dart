import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:shimmer/shimmer.dart';

import 'choose_department_item.dart';

class ChooseDepartmentListItemWidget extends StatefulWidget {
  final List<DepartmentItem> listChooseDepartmentItem;
  final bool isLoading;
  final bool isFirstLoading;

  const ChooseDepartmentListItemWidget({
    super.key,
    required this.listChooseDepartmentItem,
    this.isLoading = false,
    this.isFirstLoading = true,
  });

  @override
  State<ChooseDepartmentListItemWidget> createState() =>
      _ChooseDepartmentListItemWidgetState();
}

class _ChooseDepartmentListItemWidgetState
    extends State<ChooseDepartmentListItemWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.isFirstLoading) {
      return Container(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
          highlightColor:
              Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
          child: Column(
            children: [
              ...List.generate(
                10,
                (_) => const ChooseDepartmentItemWidget(
                  name: 'Department Name...',
                  description: 'Description...',
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Column(
        children: [
          ...widget.listChooseDepartmentItem.map(
            (item) => ChooseDepartmentItemWidget(
              name: item.name,
              description: item.description,
            ),
          ),
          if (widget.isLoading)
            Container(
              padding: const EdgeInsets.only(bottom: 16),
              child: const Center(
                child: CustomCircularProgressinDicator(),
              ),
            )
        ],
      ),
    );
  }
}
