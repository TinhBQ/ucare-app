import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';

class LoadingOverlay {
  static OverlayEntry? _overlayEntry;

  static void showLoading(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _overlayEntry ??= OverlayEntry(
        builder: (context) => Stack(
          children: [
            // Background dim
            ModalBarrier(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              dismissible: false,
            ),
            // Loading indicator
            const Center(
              child: CustomCircularProgressinDicator(),
            ),
          ],
        ),
      );
      Overlay.of(context).insert(_overlayEntry!);
    });
  }

  static void dismissLoading() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
