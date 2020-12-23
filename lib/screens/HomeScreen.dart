import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formkey = GlobalKey<FormState>();

  var _controllerUsername = TextEditingController();

  String username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                  controller: _controllerUsername,
                  validator: (str) {
                    if (str.isEmpty) {
                      return "Username tidak boleh kosong";
                    }
                    if(str.length<3){
                      return "Panjang minimal 3 karakter";
                    }
                    return null;
                  },
                  onSaved: (str) {
                    username = str;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (str) {
                    if (str.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    if(str.length<6){
                      return "Panjang minimal 6 karakter";
                    }
                    return null;
                  },
                  
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        _controllerUsername.clear();
                      },
                      child: Text('Reset'),
                    ),
                    // SizedBox(width:10),
                    RaisedButton(
                      onPressed: () {
                        // validasi field2 yg ada
                        print('validasi form, trigger semua validasi yg ada');
                        if (formkey.currentState.validate()) {

                          // trigger parameter onsaved
                          print('semua form sudah valid, simpan semua nilai');
                          // formkey.currentState.save();
                          // print('username: $username');
                        } else {}
                      },
                      child: Text('Simpan'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
