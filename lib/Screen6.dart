import 'package:flutter/material.dart';
import 'package:tes_flutter/Screen7.dart';

class Screen6 extends StatefulWidget {
  @override
  _Screen6State createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  var t = 'ini berasal dari variabel t kecil';
  var showT2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Statefull Widget'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(t),
            if (showT2 == true) Text('abcdef'),
            RaisedButton(
              onPressed: () {
                print('btn clicked');
                setState(() {
                  t = 'tombol telah di-klik';
                  showT2 = !showT2;
                });
              },
              child: Text('click me'),
            ),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (c) {
                        return Screen7();
                      },
                    ),
                  );
                },
                child: Text('pindah')),
          ],
        ),
      ),
    );
  }
}
