import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';

import 'choose_department_item.dart';

class ChooseDepartmentListItemWidget extends StatefulWidget {
  final List<DepartmentItem> listChooseDepartmentItem;

  const ChooseDepartmentListItemWidget({
    super.key,
    required this.listChooseDepartmentItem,
  });

  @override
  State<ChooseDepartmentListItemWidget> createState() =>
      _ChooseDepartmentListItemWidgetState();
}

class _ChooseDepartmentListItemWidgetState
    extends State<ChooseDepartmentListItemWidget> {
  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
