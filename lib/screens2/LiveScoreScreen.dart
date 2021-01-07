import 'package:flutter/material.dart';

class LiveScoreScreen extends StatefulWidget {
  @override
  _LiveScoreScreenState createState() => _LiveScoreScreenState();
}

class _LiveScoreScreenState extends State<LiveScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(11, 11, 11, 1),
      appBar: buildAppBar(),
      body: Column(
        children: [
          buildRowTanggal(),
          buildJadwalPertandingan(),
        ],
      ),
    );
  }

  Expanded buildJadwalPertandingan() {
    return Expanded(
      child: ListView(
        children: [
          buidlRowPertandingan(),
          buidlRowPertandingan(),
          buidlRowPertandingan(),
          buidlRowPertandingan(),
          buidlRowPertandingan(),
          buidlRowPertandingan(),
          buidlRowPertandingan(),
          buidlRowPertandingan(),
          buidlRowPertandingan(),
          buidlRowPertandingan(),
          buidlRowPertandingan(),
          buidlRowPertandingan(),
          buidlRowPertandingan(),
        ],
      ),
    );
  }

  Row buildRowTanggal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          // width: 50,
          decoration: BoxDecoration(color: Colors.white60),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            'LIVE',
          ),
        ),
        buildDay('FRI', '1 JAN'),
        buildDay('SAT', '2 JAN'),
        buildDay('TODAY', '3 JAN'),
        buildDay('MON', '4 JAN'),
        buildDay('TUE', '5 JAN'),
        Icon(Icons.calendar_today_outlined, color: Colors.white),
      ],
    );
  }

  Widget buidlRowPertandingan() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(
            'FT',
            style: TextStyle(color: Colors.white54),
          ),
          padding: EdgeInsets.all(20),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildClubAndScore(icon: Icons.ac_unit_sharp, clubName: 'Brighton Hove Albion', score: 2),
              buildClubAndScore(icon: Icons.access_time_outlined, clubName: 'Chelsea', score: 3, clubIconUrl: 'https://icons.iconarchive.com/icons/giannis-zographos/english-football-club/256/Chelsea-FC-icon.png'),
            ],
          ),
        ),
        Container(
          child: Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          padding: EdgeInsets.all(20),
        ),
      ],
    );
  }

  Row buildClubAndScore({
    icon: IconData,
    String clubName,
    int score,
    String clubIconUrl,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (clubIconUrl == null)
              Icon(
                icon,
                color: Colors.white60,
              )
            else
              Image.network(
                clubIconUrl,
                height: 25,
              ),
            SizedBox(
              width: 10,
            ),
            Text(
              clubName,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        Text(
          '$score',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Column buildDay(String day, String date) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          date,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings),
          SizedBox(width: 5),
          Text('Football'),
          SizedBox(width: 5),
          Icon(Icons.arrow_drop_down),
        ],
      ),
      leading: Icon(
        Icons.settings_applications_rounded,
        size: 40,
      ),
    );
  }
}
