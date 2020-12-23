import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tes_flutter/screens/HomeScreen.dart';

class TourScreen extends StatefulWidget {
  @override
  _TourScreenState createState() => _TourScreenState();
}

class _TourScreenState extends State<TourScreen> {
  var pageController = PageController(
    initialPage: 0,
  );

  setTourLengkap() async {
    var sp = await SharedPreferences.getInstance();
    sp.setBool('sudah-tour4', true);
    print('simpan sudah pernah tur aplikasi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (int index) {
          if (index == 2) {
            setTourLengkap();
          }
        },
        children: [
          MyPageContent(
            teks: 'Page 1',
          ),
          MyPageContent(
            teks: 'Page 2',
          ),
          MyPageContent(
            teks: 'Page 3',
            showNav: true,
          ),
        ],
      ),
    );
  }
}

class MyPageContent extends StatelessWidget {
  String teks;
  bool _showNav = false;
  MyPageContent({@required this.teks, bool showNav = false}) {
    _showNav = showNav;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: Colors.red,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  teks,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                if (_showNav)
                  RaisedButton(
                    onPressed: () {
                      // Navigator.of(context).pus
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx2){
                        return HomeScreen();
                      }), (route) => false);
                    },
                    child: Text('Home screen'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
