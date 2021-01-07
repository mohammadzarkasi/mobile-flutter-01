import 'package:flutter/material.dart';

class SettingScreen2 extends StatefulWidget {
  @override
  _SettingScreen2State createState() => _SettingScreen2State();
}

class _SettingScreen2State extends State<SettingScreen2> {
  List<bool> listcentang = [false,false,false,false,false, false];
  @override
  Widget build(BuildContext context) {
    // scafold adalah screen/halaman/page
    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 40, 40, 1),
      appBar: new AppBar(
        title: Text('Notifikasi'),
        backgroundColor: Color.fromRGBO(30, 30, 30, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: Text('Notifikasi Seluler', style: TextStyle(color: Colors.white)),
            padding: EdgeInsets.only(left: 10),
          ),
          SizedBox(
            height: 15,
          ),
          ...listcentang.map((e) {
            return buildItemSetting(e);
          }).toList(),
          // buildItemSetting(),
          // buildItemSetting(),
          // buildItemSetting(),
          // buildItemSetting(),
          // buildItemSetting(),
          // buildItemSetting(),
        ],
      ),
    );
  }

  Widget buildItemSetting(bool val) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(color: Color.fromRGBO(50, 50, 50, 1), borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ringkasan Terjadwal',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Dapatkan semua notifikasi sebagai ringkasan harian pukul 17.00. Ketuk untuk menyesuaikan waktu pengiriman.',
                  style: TextStyle(
                    color: Color.fromRGBO(170, 170, 170, 1),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: val,
            onChanged: (bool val) {
              
            },
          ),
        ],
      ),
    );
  }
}
