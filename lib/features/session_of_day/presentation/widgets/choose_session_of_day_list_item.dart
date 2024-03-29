import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:shimmer/shimmer.dart';

import 'choose_session_of_day_item.dart';

class ChooseSessionOfDayListItemWidget extends StatefulWidget {
  final List<SessionOfDayItem> listSessionOfDayItem;
  final bool isLoading;
  final bool isFirstLoading;

  const ChooseSessionOfDayListItemWidget({
    super.key,
    required this.listSessionOfDayItem,
    this.isLoading = false,
    this.isFirstLoading = true,
  });

  @override
  State<ChooseSessionOfDayListItemWidget> createState() =>
      _ChooseSessionOfDayListItemWidgetState();
}

class _ChooseSessionOfDayListItemWidgetState
    extends State<ChooseSessionOfDayListItemWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.isFirstLoading) {
      return Container(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        child: Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
          highlightColor:
              Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
          child: const Column(
            children: [
              ChooseSessionOfDayItemWidget(
                content: 'Content',
              ),
              ChooseSessionOfDayItemWidget(
                content: 'Content',
              ),
              ChooseSessionOfDayItemWidget(
                content: 'Content',
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
          ...widget.listSessionOfDayItem.map(
            (item) => ChooseSessionOfDayItemWidget(
              content: item.content,
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
