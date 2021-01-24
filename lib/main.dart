import 'package:dokandar_app/screens/welcome/welcome_screen.dart';
import 'package:dokandar_app/shared/colors.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DokanDar',
        theme: ThemeData(
          scaffoldBackgroundColor: bgColor,
          primaryColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: WelcomeScreen());
  }
}
