import 'package:dokandar_app/shared/color.dart';
import 'package:dokandar_app/shared/inputField.dart';
import 'package:dokandar_app/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import './SignInPage.dart';

class SignUpPage extends StatefulWidget {
  final String pageTitle;

  SignUpPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: Text('Sign Up',
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'Poppins', fontSize: 15)),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                // Navigator.of(context).pushReplacementNamed('/signin');
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SignInPage()));
              },
              child: Text('Sign In', style: contrastText),
            )
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Welcome to dokan!', style: h3),
                      Text('Let\'s get started', style: taglineText),
                      dokanTextInput('Username'),
                      dokanTextInput('Full Name'),
                      dokanEmailInput('Email Address'),
                      dokanPasswordInput('Password')
                    ],
                  ),
                  Positioned(
                    bottom: 15,
                    right: -15,
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft, child: null,
                              // child: Dashboard()
                            ));
                      },
                      color: primaryColor,
                      padding: EdgeInsets.all(13),
                      shape: CircleBorder(),
                      child: Icon(Icons.arrow_forward, color: white),
                    ),
                  )
                ],
              ),
              height: 360,
              width: double.infinity,
              decoration: authPlateDecoration,
            ),
          ],
        ));
  }
}
