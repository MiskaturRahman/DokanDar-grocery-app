import 'package:dokandar_app/screens/Dashboard.dart';
import 'package:dokandar_app/screens/addToCart/Cart.dart';
import 'package:dokandar_app/screens/addToCart/catalog.dart';
import 'package:dokandar_app/screens/cart.dart';
import 'package:dokandar_app/screens/catalog.dart';
import 'package:dokandar_app/screens/welcome/welcome_screen.dart';
import 'package:dokandar_app/shared/color.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // In this sample app, CatalogModel never changes, so a simple Provider
          // is sufficient.
          Provider(create: (context) => CatalogModel()),
          // CartModel is implemented as a ChangeNotifier, which calls for the use
          // of ChangeNotifierProvider. Moreover, CartModel depends
          // on CatalogModel, so a ProxyProvider is needed.
          ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catalog, cart) {
              cart.catalog = catalog;
              return cart;
            },
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DokanDar',
          theme: ThemeData(
            scaffoldBackgroundColor: bgColor,
            primaryColor: kPrimaryColor,
            textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: WelcomeScreen(),
          routes: {
            '/': (context) => Dashboard(),
            '/catalog': (context) => MyCatalog(),
            '/cart': (context) => MyCart(),
          },
        ));
  }
}
