import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:shimmer/shimmer.dart';

import 'department_choose_item.dart';

class DepartmentChooseListItem extends StatefulWidget {
  final List<DepartmentItem> listChooseDepartmentItem;
  final bool isLoading;
  final bool isFirstLoading;
  final Function(DepartmentItem item) onClick;
  final bool isAll;

  const DepartmentChooseListItem({
    super.key,
    required this.listChooseDepartmentItem,
    this.isLoading = false,
    this.isFirstLoading = true,
    required this.onClick,
    this.isAll = true,
  });

  @override
  State<DepartmentChooseListItem> createState() =>
      _DepartmentChooseListItemState();
}

class _DepartmentChooseListItemState extends State<DepartmentChooseListItem> {
  final departmentItem = DepartmentItem(
    id: '0',
    name: 'Tất cả',
  );

  @override
  Widget build(BuildContext context) {
    if (widget.isFirstLoading) {
      return Container(
        padding:
            const EdgeInsets.only(top: 16, right: 20, left: 20, bottom: 16),
        child: Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
          highlightColor:
              Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
          child: Column(
            children: [
              ...List.generate(
                10,
                (_) => DepartmentChooseItem(
                  name: 'Department Name...',
                  description: 'Description...',
                  onClick: () {},
                  service_charge: '100000',
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.only(top: 16, right: 20, left: 20),
      child: Column(
        children: [
          if (widget.isAll)
            ...[departmentItem, ...widget.listChooseDepartmentItem].map(
              (item) => DepartmentChooseItem(
                name: item.name,
                description: item.description,
                onClick: () {
                  widget.onClick(item);
                },
                service_charge: item.service_charge.toString(),
              ),
            ),
          if (!widget.isAll)
            ...widget.listChooseDepartmentItem.map(
              (item) => DepartmentChooseItem(
                name: item.name,
                description: item.description,
                onClick: () {
                  widget.onClick(item);
                },
                service_charge: item.service_charge.toString(),
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
