import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PatientProfileDetailItem extends StatelessWidget {
  const PatientProfileDetailItem({
    super.key,
    required this.label,
    required this.content,
  });
  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                    fontSize: 16,
                  ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
