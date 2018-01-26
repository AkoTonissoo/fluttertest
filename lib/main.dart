import 'package:flutter/material.dart';
import 'package:fluttertest/screens/home.dart';
import 'package:fluttertest/screens/startRegistration.dart';
import 'package:fluttertest/screens/loggedInHome.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(new MyApp());
  FirebaseDatabase.instance.setPersistenceEnabled(true);

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Navigation',
      routes: <String,WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(),
        '/StartRegistration': (BuildContext context) => new StartRegistration(),
        '/LoggedInHome': (BuildContext context) => new LoggedInHome(),
      },
      home: new Home(),
    );
  }

}