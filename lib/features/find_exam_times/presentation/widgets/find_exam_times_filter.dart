import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import './find_exam_times_item.dart';

class FindExamTimesFilter extends StatefulWidget {
  const FindExamTimesFilter({super.key});

  @override
  State<FindExamTimesFilter> createState() => _FindExamTimesFilterState();
}

class _FindExamTimesFilterState extends State<FindExamTimesFilter> {
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return SizedBox(
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FindExamTimesItem(
              title: 'Lọc chuyên khoa',
              subtitle: 'Chọn chuyên khoa khám bệnh',
              width: sizeScreen.width / 2 - 0.5,
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.CHOOSE_DEPARTMET_PAGE);
              },
            ),
            SizedBox(
              width: 1,
              child: VerticalDivider(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            FindExamTimesItem(
              title: 'Lọc ngày khám',
              subtitle: 'Chọn ngày khám bệnh',
              width: sizeScreen.width / 2 - 0.5,
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.CHOOSE_SESSION_OF_DAY);
              },
            ),
          ],
        ),
      ),
    );
  }
}
