import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' as mypath;
import 'package:path_provider/path_provider.dart' as pathprov;
import 'package:ext_storage/ext_storage.dart' as exstor;
import 'package:permission_handler/permission_handler.dart' as permhand;

class CameraScreen extends StatefulWidget {
  CameraDescription camera;
  int angka = 0;

  CameraScreen({this.camera}) {
    print('constructor CAMERA SCREEN');
  }

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  var cameraReady = false;

  CameraController _cameraController;

  void initState() {
    super.initState();
    print('CAMERA SCREEN: init state');
    _initController();
    // widget.angka
  }

  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  _initController() async {
    _cameraController = new CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    await _cameraController.initialize();

    setState(() {
      cameraReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: Center(
        child: cameraReady == true ? this.buildCameraView() : this.buildCameraPreparing(),
      ),
      floatingActionButton: cameraReady ? this.buildCameraButton() : null,
    );
  }

  Widget buildCameraPreparing() {
    return Column(
      children: [
        Text('Menyiapkan kamera....'),
        CircularProgressIndicator(),
      ],
    );
  }

  Widget buildCameraView() {
    return CameraPreview(_cameraController);
  }

  Widget buildCameraButton() {
    return FloatingActionButton(
      child: Icon(Icons.camera_alt),
      onPressed: this.pressCamera,
    );
  }

  void pressCamera() async {
    print('camera action pressed');
    // var tempDir = await getTemporaryDirectory();
    var tempDir = await pathprov.getTemporaryDirectory();
    var extdir = await pathprov.getExternalStorageDirectory();
    var appdocdir = await pathprov.getApplicationDocumentsDirectory();
    var appsupdir = await pathprov.getApplicationSupportDirectory();

    var extstor1 = await exstor.ExtStorage.getExternalStorageDirectory();
    var extstor2 = await exstor.ExtStorage.getExternalStoragePublicDirectory(exstor.ExtStorage.DIRECTORY_DOCUMENTS);

    // var downDir = await pathprov.getDownloadsDirectory();
    // var libdir = await pathprov.getLibraryDirectory();

    var saveDir = tempDir.path;
    saveDir = extdir.path;
    saveDir = appdocdir.path;
    saveDir = appsupdir.path;

    saveDir = extstor1;
    saveDir = extstor2;

    print('pathprov exdir: ${extdir.path}');
    print('exstor exdir: $extstor1');
    // saveDir = downDir.path;
    // saveDir = libdir.path;
    var dt = DateTime.now();
    var skrg = '${dt.year}-${dt.month}-${dt.day}-${dt.hour}-${dt.minute}-${dt.second}.png';

    var savePath = mypath.join(saveDir, skrg);

    print('save path = $savePath');

    var permstatus = await permhand.Permission.storage.status;
    print('CAMERA SCREEN: permission: $permstatus--');

    if (permstatus.isUndetermined) {
      Map<permhand.Permission, permhand.PermissionStatus> statuses = await [permhand.Permission.storage].request();

      if (statuses[permhand.Permission.storage] == permhand.PermissionStatus.granted) {
        print('permission granted, saving file');
        _cameraController.takePicture().then((file) {
          file.saveTo(savePath);
        });
      }
    } else {
      print('permission already granted, saving file');
      _cameraController.takePicture().then((file) {
        file.saveTo(savePath);
      });
    }

    // else {
    //   print('permission: ${permstatus}');
    //   Map<permhand.Permission, permhand.PermissionStatus> statuses =
    //       await [permhand.Permission.storage].request();
    //   if (statuses[permhand.Permission.storage] ==
    //       permhand.PermissionStatus.granted) {
    //     print('permission granted, saving file');
    //     _cameraController.takePicture().then((file) {
    //       file.saveTo(savePath);
    //     });
    //   }
    // }
  }
}
