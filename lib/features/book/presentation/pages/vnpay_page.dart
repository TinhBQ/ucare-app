import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/configs/routes/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VnpayPage extends StatelessWidget {
  final String link;

  const VnpayPage({
    super.key,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    print('link $link');
    return Scaffold(
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith('https://online.hcmute.edu.vn/')) {
                  Navigator.of(context).pushNamed(AppRoutes.APPLICATION);
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(
            Uri.parse(link),
          ),
      ),
    );
  }
}
