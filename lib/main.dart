import 'package:flutter/material.dart';
import 'package:fluttertest/screens/home.dart';
import 'package:fluttertest/screens/second.dart';
import 'package:fluttertest/screens/third.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Navigation',
      routes: <String,WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(),
        '/Second': (BuildContext context) => new Second(),
        '/Third': (BuildContext context) => new Third(),
      },
      home: new Home(),
    );
  }

}
