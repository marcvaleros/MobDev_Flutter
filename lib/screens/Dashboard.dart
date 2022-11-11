import 'package:flutter/material.dart';
import 'package:midterm_project/screens/Settings.dart';

class Dashboard extends StatefulWidget {
  static String routeName = "/dashboard";
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class LoginCredentials {
  final String msg;
  LoginCredentials(this.msg);
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as LoginCredentials;
    String allCaps = args.msg.toUpperCase();
    return Scaffold(
        appBar: AppBar(
          title: const Text("DASHBOARD"),
          backgroundColor: Color.fromARGB(255, 127, 202, 40),
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Settings.routeName);
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.settings,
                    size: 30,
                  ),
                ))
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: const AssetImage("assets/signup_scrn.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6), BlendMode.dstATop),
                ),
              ),
            ),
            Text("WELCOME, $allCaps",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  background: Paint()
                    ..color = Color.fromARGB(255, 127, 202, 40)
                    ..strokeWidth = 20
                    ..strokeJoin = StrokeJoin.round
                    ..strokeCap = StrokeCap.round
                    ..style = PaintingStyle.stroke,
                  color: Colors.white,
                ))
          ],
        ));
  }
}
