import 'package:flutter/material.dart';
import 'package:hive_practice_1/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _username = TextEditingController();
    TextEditingController _password = TextEditingController();
    Future<void> login() async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setBool('key', true);
    }

    void logged() {
      if (_username.text.isEmpty || _password.text.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Enter Both fields")));
      } else if (_username.text != 'db' || _password.text != '0000') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Entry")));
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Students DataBase Login"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _username,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Enter User Name"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              controller: _password,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Enter Password"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  login();
                  logged();
                  _username.clear();
                  _password.clear();
                },
                child: Text("Login")),
          ],
        ),
      )),
    );
  }
}
