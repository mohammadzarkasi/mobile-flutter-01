import 'package:flutter/material.dart';
import 'package:tes_flutter/Screen2.dart';

class Screen1 extends StatelessWidget {
  Widget container1() {
    return Container(
      child: Text('Hello 1234567890abcd'),
      // color: Colors.green,
      padding: EdgeInsets.all(15),
    );
  }

  Widget buildBody() {
    return Column(
      /** tinggi nya infinite, atau memenuhi sumbu Y yg tersedia
             * lebarnya mengikuti lebar children
            */
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        container1(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Hello 21'),
        ),
        Text('Hello 3'),
        Text('Hello 4'),
        SizedBox(
          height: 100,
        ),
        SizedBox(
          height: 100,
        ),
        SizedBox(
          height: 100,
        ),
        RaisedButton(
          onPressed: () {},
          child: Text('Click Me!!'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello there!!!'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Text('menu 1'),
            Text('menu 2'),
            Text('menu 3'),
            Text('menu 4'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // child: buildBody(),
        child: Column(
          children: [
            Text('Screen 1'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return Screen2();
                    },
                  ),
                );
              },
              child: Text('Pindah'),
            )
          ],
        ),
      ),
    );
  }
}
