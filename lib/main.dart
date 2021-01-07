import 'package:flutter/material.dart';
import 'package:tes_flutter/screens/ChooseCameraScreen.dart';
import 'package:tes_flutter/screens/MapScreen.dart';
import 'package:tes_flutter/screens2/LiveScoreScreen.dart';
import 'package:tes_flutter/screens2/SettingScreen.dart';
import 'package:tes_flutter/screens2/SettingScreen2.dart';

void main() {
  var app = new MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  /** alt shif f */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter',
      // home: LandingScreen(),
      // home: ChooseCameraScreen(),
      // home: new SettingScreen2(),
      home: LiveScoreScreen(),
    );
  }
}

