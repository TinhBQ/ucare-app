import 'package:flutter/material.dart';

class CustomCircularProgressinDicator extends StatelessWidget {
  const CustomCircularProgressinDicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        color: Colors.green,
        backgroundColor: Colors.amberAccent,
        strokeWidth: 4.0,
      ),
    );
  }
}
