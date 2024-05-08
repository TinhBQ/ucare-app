import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/model/request_models/request_models.dart';
import 'package:mobile_advanced_project_fe/features/history/presentation/widgets/history_paymet_item.dart';

class HistoryPaymetListCardWidget extends StatefulWidget {
  final List<MyOrderItem> myOrderItems;
  const HistoryPaymetListCardWidget({
    super.key,
    required this.myOrderItems,
  });

  @override
  State<HistoryPaymetListCardWidget> createState() =>
      _HistoryPaymetListCardWidgetState();
}

class _HistoryPaymetListCardWidgetState
    extends State<HistoryPaymetListCardWidget> {
  OrderDescription orderDescription(String description) {
    Map<String, dynamic> decodedData = jsonDecode(description);
    return OrderDescription.fromJson(decodedData);
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: widget.myOrderItems.length,
      itemBuilder: (context, index) {
        OrderDescription orderDescriptions =
            orderDescription(widget.myOrderItems[index].description ?? '');
        return HistoryPaymentItemWidget(
          doctorName: orderDescriptions.schedules.first.doctorName,
          sessionName: orderDescriptions.schedules.first.session,
          departmentName: orderDescriptions.schedules.first.department,
          day: orderDescriptions.schedules.first.day,
          price: '${orderDescriptions.totalPrice} VNĐ',
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 0,
        );
      },
    );
  }
}
