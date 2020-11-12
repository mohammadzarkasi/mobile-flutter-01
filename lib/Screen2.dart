import 'package:flutter/material.dart';
import 'package:tes_flutter/Screen3.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(100),
            color: Colors.amber,
            child: Text('Screen 2'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Kembali'),
          ),
          // Icon(Icons.access_alarm_rounded),
          Image(
            image: AssetImage('assetsss/imgs/img1.png'),
            width: 200,
          ),
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {
              // print('icon diklik');
              // Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return Screen3();
                  },
                ),
              );
            },
          ),
          FlatButton(
            onPressed: () {},
            child: Text('Kembali lagi'),
          ),
        ],
      ),
    );
  }
}
