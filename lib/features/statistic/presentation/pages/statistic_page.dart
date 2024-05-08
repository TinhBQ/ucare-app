import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widget_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/items/item_dependencies.dart';
import 'package:mobile_advanced_project_fe/core/utils/utils_dependencies.dart';
import 'package:mobile_advanced_project_fe/features/statistic/presentation/bloc/statistic_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatefulWidget> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  List<MonthToMonthItem>? monthToMonthItems;

  final String currentMonth = DateTime.now().month.toString();
  @override
  void initState() {
    context.read<StatisticBloc>().add(StatisticGetMonthToMonth(
        start: "2024-01", end: "2024-$currentMonth"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StatisticBloc, StatisticState>(
      listener: (context, state) {
        if (state is StatisticLoading) {
          LoadingOverlay.showLoading(context);
        } else {
          LoadingOverlay.dismissLoading();
        }
        if (state is StatisticStateFailure) {
          ShowSnackBar.error(state.message, context);
        }
        if (state is StatisticStateSuccess) {
          setState(() {
            monthToMonthItems = state.monthToMonthItems;
          });
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const CustomAppBar(
          title: 'Thống kê thanh toán',
        ),
        body: Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: SfCartesianChart(
              // Khai báo chuỗi dữ liệu (series)
              series: <CartesianSeries<MonthToMonthItem, String>>[
                LineSeries<MonthToMonthItem, String>(
                  // Dữ liệu nguồn
                  dataSource: monthToMonthItems,
                  xValueMapper: (MonthToMonthItem month, _) => month.date,
                  yValueMapper: (MonthToMonthItem month, _) => month.value,
                ),
              ],
              primaryXAxis: const CategoryAxis(
                labelRotation: 60,
              ),
              primaryYAxis: const NumericAxis(),
            ),
          ),
        ),
      ),
    );
  }
}
