import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:myportfolio/profile_page.dart';
import 'package:myportfolio/project_info.dart';
import 'package:myportfolio/project_page.dart';

void main() {
  var routePath = "/";

  var route = html.window.document.getElementById("route");
  if (route != null) {
    routePath += route.innerHtml;
  }

  runApp(MyApp(route: routePath));
}

class MyApp extends StatelessWidget {
  final String route;

  const MyApp({Key key, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
        fontFamily: 'GoogleSansRegular',
      ),
      home: page(),
    );
  }

  Widget page() {
  switch (route) {
    case "/": return ProfilePage();
    case "/project": return ProjectPage();
    case "/projectInfo": return ProjectInfo();
    default: return ProfilePage(); // to be double sure
  }
}
}