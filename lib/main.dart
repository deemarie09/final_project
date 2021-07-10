import 'package:final_project/HomePage.dart';
import 'package:final_project/LogInScreen.dart';
import 'package:final_project/UserProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_project/provider/Category_provider.dart';
import 'package:final_project/provider/Product_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (ctx) => CategoryProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (ctx) => ProductProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // primarySwatch: Colors.orange,
            ),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, snapShot) {
            if (snapShot.hasData) {
              return LogInScreen();
            } else {
              return HomePage();
            }
          },
        ),
      ),
    );
    // home: AddToCartScreen(),
    // initialRoute: 'home',
    // routes: {
    //   'auth': (context) => AuthenticationScreen(),
    //   'list': (context) => ListProduct(),
    //   'home': (context) => HomePage(),
    //   'detail': (context) => DetailPage(),
    //   'checkout': (context) => CheckOut(),
    //   'welcome': (context) => WelcomeScreen(),
    //},
    //);
  }
}
