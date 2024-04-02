import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class ProfileDetailsListCardWidget extends StatelessWidget {
  const ProfileDetailsListCardWidget({
    super.key,
    required this.onChoose,
  });
  final VoidCallback onChoose;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 20, //độ dài list profile
        itemBuilder: (context, index) {
          return ProfileDetailCard(onChoose: onChoose,);
        },
      ),
    );
  }
}
