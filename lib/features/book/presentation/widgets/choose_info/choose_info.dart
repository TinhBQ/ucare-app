import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class ChooseInfoWidget extends StatefulWidget {
  const ChooseInfoWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ChooseInfoWidgetState();
}

class _ChooseInfoWidgetState extends State<ChooseInfoWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: SubAppBarWidget(
        title: 'Chọn thông tin khám',
      ),
      body: CustomScrollView(),
    );
  }
}
