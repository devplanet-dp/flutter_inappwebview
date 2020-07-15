import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebRTCView extends StatefulWidget {
  @override
  _InAppWebRTCViewState createState() => _InAppWebRTCViewState();
}

class _InAppWebRTCViewState extends State<InAppWebRTCView> {
  InAppWebViewController _inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: InAppWebView(
                  initialUrl: "https://appr.tc",
                  initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                    mediaPlaybackRequiresUserGesture: false,
                    debuggingEnabled: true,
                  )),
                  onWebViewCreated: (InAppWebViewController controller) {
                    _inAppWebViewController = controller;
                  },
                  androidOnPermissionRequest:
                      (InAppWebViewController controller, String origin,
                          List<String> resources) async {
                    return PermissionRequestResponse(
                        resources: resources,
                        action: PermissionRequestResponseAction.GRANT);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
