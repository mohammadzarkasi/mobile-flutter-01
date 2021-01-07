import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool ringkasanTerjadwal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Notifikasi'),
      ),
      body: new Stack(
        children: [
          new Container(
            color: Color.fromRGBO(40, 40, 40, 1),
          ),
          new SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notifikasi Seluler',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                buildItemSetting('Ringkasan Terjadwal'),
                buildItemSetting('Subscription'),
                // buildItemSetting(),
                // buildItemSetting(),
                // buildItemSetting(),
                // buildItemSetting(),
                // buildItemSetting(),
                // buildItemSetting(),
              ],
            ),
          ),
        ],
      ),
      // body:
      // ),
    );
  }

  Widget buildItemSetting(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(50, 50, 50, 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // 'Ringkasan Terjadwal',
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Dapatkan semua notifikasi sebagai ringkasan harian pukul 17:00. Ketuk untuk menyesuaikan waktu pengiriman',
                  style: TextStyle(
                    color: Color.fromRGBO(170, 170, 170, 1),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            onChanged: (bool value) {
              setState(() {
                ringkasanTerjadwal = !ringkasanTerjadwal;
              });
            },
            value: ringkasanTerjadwal,
          ),
        ],
      ),
    );
  }
}
