import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';

import 'choose_session_of_day_item.dart';

class ChooseSessionOfDayListItemWidget extends StatefulWidget {
  final List<SessionOfDayItem> listSessionOfDayItem;
  final bool isLoading;
  final bool isFirstLoading;
  final Function(SessionOfDayItem item) onClick;

  const ChooseSessionOfDayListItemWidget({
    super.key,
    required this.listSessionOfDayItem,
    this.isLoading = false,
    this.isFirstLoading = true,
    required this.onClick,
  });

  @override
  State<ChooseSessionOfDayListItemWidget> createState() =>
      _ChooseSessionOfDayListItemWidgetState();
}

class _ChooseSessionOfDayListItemWidgetState
    extends State<ChooseSessionOfDayListItemWidget> {
  final sessionOfDayItem = SessionOfDayItem(
    id: '0',
    content: 'Tất cả',
  );

  @override
  Widget build(BuildContext context) {
    if (widget.isFirstLoading) {
      return Container(
        padding: const EdgeInsets.only(top: 16, right: 20, left: 20),
        child: Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
          highlightColor:
              Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
          child: Column(
            children: [
              ...List.generate(
                10,
                (_) => ChooseSessionOfDayItemWidget(
                  content: 'Content',
                  onClick: () {},
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
          ...[sessionOfDayItem, ...widget.listSessionOfDayItem].map(
            (item) => ChooseSessionOfDayItemWidget(
              content: item.content,
              onClick: () {
                widget.onClick(item);
              },
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
