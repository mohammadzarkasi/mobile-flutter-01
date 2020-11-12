import 'package:flutter/material.dart';

class Screen8 extends StatefulWidget {
  @override
  _Screen8State createState() => _Screen8State();
}

class _Screen8State extends State<Screen8> {
  var nama_barang = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tambah item'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              onChanged: (s){
                // print('inp: $s');
                nama_barang = s;
              },
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop(nama_barang);
              },
              child: Text('simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
