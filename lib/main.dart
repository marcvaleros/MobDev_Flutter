import 'package:flutter/material.dart';
import 'package:midterm_project/routes.dart';
import 'package:midterm_project/screens/LoginScreen.dart';
// import './screens/loginscreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: routes,
    ),
  );
}
