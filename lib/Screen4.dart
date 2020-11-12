import 'package:flutter/material.dart';
import 'package:tes_flutter/Screen5.dart';

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  var text1 = "click count: ";
  var counter = 0;
  var showText2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 4'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(text1 + ' ' + counter.toString()),
            if (showText2) Text('text 2'),
            RaisedButton(
              onPressed: () {
                print('button diclick');
                setState(() {
                  counter++;
                });
              },
              child: Text('clik here'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  showText2 = !showText2;
                  print('show text 2? $showText2');
                });
              },
              child: Text('toggle text2'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return Screen5();
                    },
                  ),
                );
              },
              child: Text('goto listview'),
            ),
          ],
        ),
      ),
    );
  }
}
