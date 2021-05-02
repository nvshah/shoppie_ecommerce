import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.greenAccent,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline5: TextStyle(fontSize: 64.0, fontWeight: FontWeight.w600),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText1: TextStyle(fontSize: 18.0),
        ),
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
