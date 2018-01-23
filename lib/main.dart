import 'package:flutter/material.dart';
import 'package:fluttertest/screens/home.dart';
import 'package:fluttertest/settings.dart';
import 'package:fluttertest/screens/second.dart';
import 'package:fluttertest/screens/third.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String _title = 'Please Login';
  Widget _screen;
  Home _Home;
  settings _settings;
  bool _authenticated;

  _MyAppState() {
    _Home = new Home(onSubmit: (){onSubmit();});
    _settings = new settings();
    _screen = _Home;
    _authenticated = false;
  }

  void onSubmit() {
    print('Login with: ' + _Home.username + ' ' + _Home.password);
    if(_Home.username == 'user' && _Home.password == 'password') {
      _setAuthenticated(true);
    }
  }



  void _setAuthenticated(bool auth) {


    setState(() {
      if(auth == true) {
        //siia on vaja saada uus leht, et on sisse logitud
      }
      else {
        _screen = _Home;
        _title = 'Please Login';
        _authenticated = false;
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Navigation',
      routes: <String,WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(onSubmit: (){onSubmit();}),
        '/Second': (BuildContext context) => new Second(),
        '/Third': (BuildContext context) => new Third(),
      },
      home: new Home(onSubmit: (){onSubmit();}),
    );
  }
}
