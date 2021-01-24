import 'package:dokandar_app/screens/login/SignUpPage.dart';
import 'package:dokandar_app/shared/colors.dart';
import 'package:dokandar_app/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignInPage extends StatefulWidget {
  final String pageTitle;

  SignInPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: Text('Sign In',
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed('/signup');
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SignUpPage()));
              },
              child: Text('Sign Up', style: contrastText),
            )
          ],
        ),
        body: new Stack(children: <Widget>[
          new Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage("images/9.png"),
                      fit: BoxFit.cover)),
              child: Center(
                child: Text(
                  'Set Full Screen Background Image in Flutter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ]));
  }
}
