import 'package:flutter/material.dart';
import 'package:myportfolio/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
        fontFamily: 'GoogleSansRegular',
      ),
      home: ProfilePage(),
    );
  }
}