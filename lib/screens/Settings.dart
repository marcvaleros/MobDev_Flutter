import 'package:flutter/material.dart';
import 'package:midterm_project/screens/LoginScreen.dart';

class Settings extends StatefulWidget {
  static String routeName = "/setting";
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text("SETTINGS"),
        backgroundColor: Color.fromARGB(255, 127, 202, 40),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    LoginScreen.routeName, (route) => false);
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.logout,
                  size: 30,
                ),
              ))
        ],
      ),
      body: const Center(
        child: Text("Settings"),
      ),
    );
  }
}
