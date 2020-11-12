import 'package:flutter/material.dart';
import 'package:tes_flutter/Screen1.dart';
import 'package:tes_flutter/Screen6.dart';

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
      title: 'Ilkom',
      home: Screen6(),
    );
  }
}
