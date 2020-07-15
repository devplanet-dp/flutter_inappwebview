import 'package:flutter/material.dart';
import 'package:flutter_inappwebview_tutorial/web_rtc_view.dart';
import 'package:permission_handler/permission_handler.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  await Permission.microphone.request();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web RTC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InAppWebRTCView(),
    );

  }
}



