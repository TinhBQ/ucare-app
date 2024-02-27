import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class CustomOTPField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String) onChanged;

  const CustomOTPField(
      {super.key,
      required this.label,
      required this.controller,
      required this.onChanged});

  // @override
  // Widget build(BuildContext context) {
  //   return TextFormField(
  //     controller: controller,
  //     textAlign: TextAlign.center,
  //     decoration: InputDecoration(
  //       border: const OutlineInputBorder(),
  //       suffixIcon: IconButton(
  //         onPressed: controller.clear,
  //         icon: const Icon(Icons.clear),
  //       ),
  //       labelText: label,
  //       hintStyle: Theme.of(context).textTheme.bodyLarge,
  //     ),
  //     onChanged: onChanged,
  //     keyboardType: TextInputType.number,
  //     maxLength: 6,
  //     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Pinput(
          controller: controller,
          length: 6,
          autofocus: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          defaultPinTheme: PinTheme(
              height: currentWidth / 6,
              width: currentWidth / 6,
              textStyle: Theme.of(context).textTheme.bodyLarge,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  )))),
    );
  }
}
