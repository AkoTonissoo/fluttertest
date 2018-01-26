import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {



  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();

  String get username => _user.text;
  String get password => _pass.text;

  String checkSignIn(FirebaseAuth auth, String user, String pass) {
    auth.signInWithEmailAndPassword(email: username, password: password);
    if (auth.currentUser() != null) {
      return "/LoggedInHome";
    }
    else {
      print("Enter correct credientals");
      return "/Home";
    }
  }


  @override
  Widget build(BuildContext context) {
    var authentication = FirebaseAuth.instance;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
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
              //new RaisedButton( child: new Text('Submit'), onPressed: onSubmit),
              new RaisedButton(
                  child:  new Text('Submit'),
                  onPressed: (){Navigator.of(context).pushNamedAndRemoveUntil(checkSignIn(authentication, username, password), (Route<dynamic> route) => false);}),
              new RaisedButton(
                  child:  new Text('Register'),
                  onPressed: (){Navigator.of(context).pushNamed('/StartRegistration');})

            ],
          ),
        ),
      ),
    );
  }
}