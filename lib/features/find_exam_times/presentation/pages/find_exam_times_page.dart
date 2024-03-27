import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';

import '../widgets/widget.dart';

class FindExamTimesPage extends StatefulWidget {
  const FindExamTimesPage({super.key});

  @override
  State<FindExamTimesPage> createState() => _FindExamTimesPageState();
}

class _FindExamTimesPageState extends State<FindExamTimesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const CustomAppBar(
        title: 'Lịch khám bệnh',
      ),
      body: const SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: FindExamTimesFilter(),
            ),
          ],
        ),
      ),
    );
  }
}
