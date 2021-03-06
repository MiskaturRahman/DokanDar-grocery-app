import 'package:dokandar_app/screens/login/SignInPage.dart';
import 'package:dokandar_app/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(100.0), // here the desired height
        // child: AppBar(
        //     title: Image.asset(
        //   'assets/images/logo.png',
        //   fit: BoxFit.contain,
        //   alignment: Alignment.center,
        // )),
        // ),
        body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/home.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        new Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 100,
              margin: EdgeInsets.only(bottom: 30, right: 10),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: SignInPage()));
                },
                color: primaryColor,
                padding: EdgeInsets.all(13),
                shape: CircleBorder(),
                child: Icon(Icons.arrow_forward, color: white),
              ),
            ))
      ],
    ));
  }
}
// dokanFlatBtn('Welcome', () {
//                 Navigator.push(
//                     context,
//                     PageTransition(
//                         type: PageTransitionType.leftToRight,
//                         child: SignInPage()));
//               }
//               ),