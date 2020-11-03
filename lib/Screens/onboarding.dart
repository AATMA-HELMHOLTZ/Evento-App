import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/login.dart';
import 'package:page_transition/page_transition.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  @override
  Widget build(BuildContext context) {

    final double screen_height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: screen_height * 0.1,
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Manage Your Events",
                      style: TextStyle(
                          color: Color(0xFFB056674),
                          fontSize: 28
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(
                        horizontal: 32
                    ),
                    child: Text(
                      "Now manage your events in an easier and more efficient way....",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFFB056674),
                          fontSize: 16
                      ),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 32
                ),
                child: Center(
                  child: Image.asset("assets/images/1.jpg",
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.5,
                  ),
                ),
              ),
            ),
            Container(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: login()));
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(32),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFFBff4b5c),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
