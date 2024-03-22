import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';

import 'choose_option_item.dart';

class ChooseOption extends StatefulWidget {
  const ChooseOption({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<ChooseOption> createState() => _ChooseOptionState();
}

class _ChooseOptionState extends State<ChooseOption> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar(
        title: widget.title,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(
              controller: _searchController,
              borderColor: Theme.of(context).colorScheme.tertiary,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  ChooseOptionItem(
                    name: 'BQT',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ChooseOptionItem(
                    name: 'BQT',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
