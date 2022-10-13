import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miit_app/pages/home.dart';
import 'package:miit_app/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  String login = '';
  @override
  void initState() {
    super.initState();
    setGroup(login);
  }

  Future<void> getGroup() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      login = (prefs.getString('login') ?? '');
    });
  }

  //Incrementing counter after click
  Future<void> setGroup(String groupName) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      login = (prefs.getString('login') ?? '');
      prefs.setString('login', groupName);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (login != '') {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      );
    } else {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      );
    }
  }
}
