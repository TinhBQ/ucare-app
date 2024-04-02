import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class ChooseProfileWidget extends StatefulWidget {
  const ChooseProfileWidget({
    super.key,
    required this.onChoose,
  });

  final VoidCallback onChoose;

  @override
  State<StatefulWidget> createState() => _ChooseProfileWidgetState();
}

class _ChooseProfileWidgetState extends State<ChooseProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: const SubAppBarWidget(
        title: 'Chọn hồ sơ đặt khám',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: Column(
          children: [
            ProfilesListCardWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Divider(
                thickness: 1,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            ProfileDetailsListCardWidget(onChoose: widget.onChoose,),
          ],
        ),
      ),
    );
  }
}
