import 'package:flutter/material.dart';
import 'package:midterm_project/screens/LoginScreen.dart';
import 'package:english_words/english_words.dart';

class Settings extends StatefulWidget {
  static String routeName = "/setting";
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _randomWordPairs = <WordPair>[];
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
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isOdd) return const Divider();

        final index = item ~/ 2;

        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase),
    );
  }
}
