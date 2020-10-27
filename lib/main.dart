import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Onboarding.dart';

void main() {
  runApp(MyApp());
}

// TEST COMMENT

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Josefin Sans"
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: onboarding(),
        ),
      ),
    );
  }
}

