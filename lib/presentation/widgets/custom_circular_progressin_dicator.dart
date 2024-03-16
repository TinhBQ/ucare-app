import 'package:flutter/material.dart';

class CustomCircularProgressinDicator extends StatelessWidget {
  const CustomCircularProgressinDicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 26,
      height: 26,
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
        backgroundColor: Colors.amberAccent,
        strokeWidth: 3.0,
      ),
    );
  }
}
