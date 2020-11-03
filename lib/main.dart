import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/onboarding.dart';
import 'package:flutter_app/sidebar/sidebar_layout.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MyApp());
}

// TEST COMMENT

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = Onboarding();
  final storage = FlutterSecureStorage();
  @override
  void initState(){
    super.initState();
    checkLogin();

  }
  void checkLogin() async {
    String token = await storage.read(key: "token");
    if (token != null) {
      setState(() {
        page = SideBarLayout();
      });
    } else {
      setState(() {
        page = Onboarding();
      });
    }
  }
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
          child: page,
        ),
      ),
    );
  }
}

