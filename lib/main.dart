import 'package:flutter/material.dart';
import 'package:tes_flutter/screens/ChooseCameraScreen.dart';

void main() {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  // WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.

  //  availableCameras().then((cameras) {
  //    var firstCamera = cameras.first;

  //  });

  // Get a specific camera from the list of available cameras.
  // final firstCamera = cameras.first;
  var app = new MyApp();
  // var app = new Camer
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
      home: ChooseCameraScreen(),
    );
  }
}
