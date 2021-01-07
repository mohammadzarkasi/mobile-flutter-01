import 'package:flutter/material.dart';
import 'package:camera/camera.dart' as cam;
import 'package:tes_flutter/screens/CameraScreen.dart';

class ChooseCameraScreen extends StatefulWidget {
  @override
  _ChooseCameraScreenState createState() => _ChooseCameraScreenState();
}

class _ChooseCameraScreenState extends State<ChooseCameraScreen> {
  List listCameras = [];

  @override
  void initState() {
    super.initState();

    print('CHOOSE CAMERA SCREEN => init widget flutter binding...');
    WidgetsFlutterBinding.ensureInitialized();
    print('flutter binding initialized');

    cam.availableCameras().then((cameras) {
      cameras.forEach((camera) {
        listCameras.add(camera);
      });
      setState(() {});
      print('jumlah kamera: ${listCameras.length}');
    });

    print("CHOOSE CAMERA SCREEN selesai");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pilih Kamera')),
      body: Center(
        child: listCameras.length > 0 ? this.buildListCamera() : this.buildNoCameraFound(),
      ),
    );
  }

  Widget buildListCamera() {
    var index = 0;
    var children = listCameras.map((camera) {
      index++;
      return buildItemCamera(camera, index);
    }).toList();

    return Column(
      children: children,
    );
  }

  Widget buildItemCamera(cam.CameraDescription camera, int index) {
    var posisiKamera = 'back';
    if (camera.lensDirection == cam.CameraLensDirection.front) {
      posisiKamera = 'front';
    }
    return RaisedButton(
      onPressed: () {
        print('button $index pressed');
        Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
          return new CameraScreen(camera: camera);
        }));
      },
      child: Text('Camera $index $posisiKamera'),
    );
  }

  Widget buildNoCameraFound() {
    return Text('Tidak ada camera');
  }
}
