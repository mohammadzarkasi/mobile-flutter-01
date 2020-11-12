import 'package:flutter/material.dart';
import 'package:tes_flutter/Screen8.dart';

class Screen7 extends StatefulWidget {
  @override
  _Screen7State createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {
  var kesukaan = [
    'barang 1',
    'barang 2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list view'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (c) {
                return Screen8();
              },
            ),
          ).then((value) {
            print('val: $value');
            if (value != null) {
              setState(() {
                kesukaan.add(value);
              });
            }
          });
        },
        child: Icon(Icons.plus_one),
      ),
      body: ListView(
        children: kesukaan.map((nama_barang) {
          return Container(
            child: Text(nama_barang),
            padding: EdgeInsets.all(30),
          );
        }).toList(),
      ),
    );
  }
}
