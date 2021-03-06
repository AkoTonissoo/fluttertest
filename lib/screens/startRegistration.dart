import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';


class StartRegistration extends StatelessWidget {


  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();
  String get username => _user.text;
  String get password => _pass.text;



  String checkRegistration(FirebaseAuth auth, String user, String pass) {
    auth.createUserWithEmailAndPassword(email: user, password: pass);
    auth.signInWithEmailAndPassword(email: user, password: pass);
    return "/LoggedInHome";

  }







  @override
  Widget build(BuildContext context) {
    //print(database.push().key);

    var authentication = FirebaseAuth.instance;


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('StartRegistration'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.home), onPressed: (){Navigator.of(context).pushNamed('/Home');}),
          new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: (){Navigator.of(context).pushNamed('/Home');}),
        ],
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(controller: _user, decoration: new InputDecoration(hintText: 'Enter a username'),),
              new TextField(controller: _pass, decoration: new InputDecoration(hintText: 'Enter a password'), obscureText: true,),
              new RaisedButton(
                  child:  new Text('Register'),
                  onPressed: (){Navigator.of(context).pushNamedAndRemoveUntil(checkRegistration(authentication, username, password), (Route<dynamic> route) => false);})

            ],
          ),
        ),
      ),
    );
  }
}