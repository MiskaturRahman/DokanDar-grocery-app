import 'package:dokandar_app/screens/login/phoneAuth/numeric_pad.dart';
import 'package:dokandar_app/screens/login/phoneAuth/verifty_phone.dart';
import 'package:dokandar_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignInPage extends StatefulWidget {
  final String pageTitle;

  SignInPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: WelcomeScreen()));
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Continue with phone",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          textTheme: Theme.of(context).textTheme,
        ),
        body: new Stack(children: <Widget>[
          new Container(
              child: Center(
                  child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                        child: Image.asset('assets/images/holding-phone.png'),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                        child: Text(
                          "You'll receive a 4 digit code.",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF818181),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Enter your phone number",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              phoneNumber,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      VerifyPhone(phoneNumber: phoneNumber)),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFDC3D),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              NumericPad(
                onNumberSelected: (value) {
                  setState(() {
                    if (value != -1) {
                      phoneNumber = phoneNumber + value.toString();
                    } else {
                      phoneNumber =
                          phoneNumber.substring(0, phoneNumber.length - 1);
                    }
                  });
                },
              ),
            ],
          )))
        ]));
  }
}
