import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tes_flutter/screens/HomeScreen.dart';
import 'package:tes_flutter/screens/TourScreen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  
  Future<bool> checkPernahTour() async {
    var sp = await SharedPreferences.getInstance();
    var pernah = sp.getBool('sudah-tour4');
    if (pernah == null) {
      pernah = false;
    }
    print('sudah pernah tour? $pernah');
    return pernah;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkPernahTour(),
        builder: (ctx, AsyncSnapshot<bool> snapshot) {
          print('snapshot: ' + snapshot.toString());
          // jika proses future nya sudah selesai
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == true) {
            print('sudah pernah tur, tampilkan home');
            return HomeScreen();
          } else {
            print('belum pernah tur, tampilkan tur dulu');
            return TourScreen();
          }
        },
      ),
    );
  }
}
