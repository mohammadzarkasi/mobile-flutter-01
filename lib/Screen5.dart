import 'package:flutter/material.dart';

class Screen5 extends StatefulWidget {
  @override
  _Screen5State createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  var keranjangBelanja = [
    'barang 1',
    'barang 2',
    'barang 3',
  ];
  var textfieldval = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list view'),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                TextField(
                  onChanged: (String t) {
                    // print('textinput value: $t');
                    textfieldval = t;
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      keranjangBelanja.add(textfieldval);
                      // keranjangBelanja = [...keranjangBelanja, textfieldval];
                      textfieldval = '';
                    });
                  },
                  child: Text('tambah'),
                ),
              ],
            ),
          ),
          Container(
            height: 400,
            child: ListView(
              children: keranjangBelanja.map((e) {
                return Padding(
                  child: Text(e),
                  padding: EdgeInsets.all(30),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
