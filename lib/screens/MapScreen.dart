import 'dart:math' as mathdart;
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart' as mb;
import 'package:geolocator/geolocator.dart' as geo;

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var token = 'pk.eyJ1IjoibW96YXIiLCJhIjoiY2tqaGExcG9wOTZ6cDJxbGJkN3N3d3g1ZSJ9.MwabQuwSTVdx2YDgAoV6Rg';

  mb.MapboxMapController mapController;
  mb.LatLng gpsLoc;
  mb.Circle curPosCircle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkPermissionGps();
  }

  void msgLocError(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return new AlertDialog(
          title: Text('Error'),
          content: Text(msg),
          actions: [
            RaisedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void getCurrentLoc() async {
    geo.Geolocator.getCurrentPosition().then((geo.Position pos) {
      print('GPS LOCATION: ${pos.latitude} ${pos.longitude}');
      if (mapController != null) {
        gpsLoc = new mb.LatLng(pos.latitude, pos.longitude);
        var newCamLoc = mb.CameraUpdate.newLatLng(gpsLoc);
        // re-center map camera
        // mapController.animateCamera(newCamLoc);

        // var newCircle = new mb.CircleOptions(
        //   geometry: gpsLoc,
        //   circleColor: 'yellow',
        //   circleStrokeColor: 'black',
        //   circleStrokeWidth: 1,
        //   circleRadius: 10,
        //   draggable: false,
        // );
        // // add marker
        // mapController.addCircle(newCircle);
        // .then((circle) {
        //   curPosCircle = circle;
        // });
      }
    });

    // var rnd = new mathdart.Random();
    // geo.Geolocator.getPositionStream(
    //   intervalDuration: new Duration(seconds: 10),
    // ).listen((geo.Position pos) {
    //   print("cur pos: ${pos.latitude} ${pos.longitude}");
    //   if (mapController != null) {
    //     if (curPosCircle != null) {
    //       mapController.removeCircle(curPosCircle).then((value) {
    //         var curLoc = new mb.LatLng(pos.latitude, pos.longitude);
    //         var colors = ['red', '#00FF00', 'blue', 'yellow', 'black', 'brown'];

    //         var ind = rnd.nextInt(colors.length);
    //         var color = colors[ind];
    //         print('color: $color, index: $ind');
    //         var newCircle = new mb.CircleOptions(
    //           geometry: curLoc,
    //           circleColor: color,
    //           circleStrokeColor: 'black',
    //           circleStrokeWidth: 1,
    //           circleRadius: 10,
    //           draggable: false,
    //         );
    //         mapController.addCircle(newCircle).then((circle2) {
    //           curPosCircle = circle2;
    //         });
    //       });
    //     }
    //   }
    // });
  }

  void checkPermissionGps() async {
    print("CHECKING LOCATION BEGIN");
    var locEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (locEnabled == false) {
      msgLocError('Layanan Lokasi tidak aktif');
    } else {
      // msgLocError('Layanan Lokasi aktif');
      geo.LocationPermission punyaIjin = await geo.Geolocator.checkPermission();

      if (punyaIjin == geo.LocationPermission.deniedForever) {
        msgLocError('aplikasi diblokir permanen');
      } else if (punyaIjin == geo.LocationPermission.denied) {
        // meminta konfirmasi ijn user
        geo.LocationPermission req = await geo.Geolocator.requestPermission();

        if (req == geo.LocationPermission.always || req == geo.LocationPermission.whileInUse) {
          // msgLocError('user mengijinkan');
          getCurrentLoc();
        } else {
          msgLocError('user tidak mengizinkan');
        }
      }
      else {
        getCurrentLoc();
      }
    }
    // var locEnabled2 = geo.Geolocator.isLocationServiceEnabled();
    // geo.Geolocator.isLocationServiceEnabled().then((bool isEnabled) {
    //   print("LOCATION SERVICE ENABLED? : $isEnabled");
    //   // device tidak mengaktifkan/memiliki location service
    //   if (isEnabled == false) {
    //     msgLocError("Layanan Lokasi tidak tersedia");
    //   }
    //   //device mengaktifkan/memiliki location service
    //   else {
    //     geo.Geolocator.checkPermission().then((geo.LocationPermission locPerm) {
    //       // app selamanya diblokir mengakses lokasi
    //       if (locPerm == geo.LocationPermission.deniedForever) {
    //         msgLocError('Tidak dapat meminta permission');
    //       }
    //       // app diblokir sementara / belum pernah mengakses lokasi sebelumnya
    //       else if (locPerm == geo.LocationPermission.denied) {
    //         // minta akses ke user
    //         geo.Geolocator.requestPermission().then((geo.LocationPermission permRes) {
    //           if (permRes == geo.LocationPermission.whileInUse || permRes == geo.LocationPermission.always) {
    //             // user mengizinkan
    //             getCurrentLoc();
    //           } else {
    //             // user tidak mengizinkan
    //             msgLocError('User tidak memberikan permission');
    //           }
    //         });
    //       }
    //       // app telah diizinkan sebelumnya
    //       else {
    //         getCurrentLoc();
    //       }
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('Map Screen')),
      body: Center(
        child: Column(
          children: [
            buildMap(),
            buildBtnBottomRow(),
          ],
        ),
      ),
    );
  }

  Widget buildMap() {
    return Container(
      height: 400,
      child: mb.MapboxMap(
        accessToken: token,
        styleString: 'mapbox://styles/mapbox/streets-v11',
        initialCameraPosition: new mb.CameraPosition(
          target: mb.LatLng(-8.1766639, 113.6916075),
          zoom: 8,
        ),
        onMapCreated: mapCreated,
        onMapClick: mapClicked,
      ),
    );
  }

  void mapClicked(mathdart.Point<double> point, mb.LatLng latlng) {
    print('lat lng clicked: ${latlng.latitude}, ${latlng.longitude}');
    if (mapController != null) {
      mapController.addCircle(
        new mb.CircleOptions(
          circleRadius: 8,
          circleColor: 'red',
          circleOpacity: 1,
          geometry: latlng,
          draggable: false,
        ),
      );
    }
  }

  void mapCreated(mb.MapboxMapController controller) {
    mapController = controller;
    print('map created');

    var lokasi = mb.LatLng(-8.1766639, 113.6916075);

    mapController.addCircle(new mb.CircleOptions(
      circleRadius: 8,
      circleColor: 'blue',
      circleOpacity: 1,
      geometry: lokasi,
      draggable: false,
    ));

    checkPermissionGps();
  }

  Widget buildBtnBottomRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RaisedButton(
          child: Text('Re-center'),
          onPressed: () {
            var center = new mb.LatLng(-8.1766639, 113.6916075);
            var updatedLoc = mb.CameraUpdate.newLatLng(center);
            if (mapController != null) {
              mapController.animateCamera(updatedLoc);
            } else {
              print('map controller is null');
            }
          },
        ),
        RaisedButton(onPressed: () {}, child: Text('Btn2')),
      ],
    );
  }
}
