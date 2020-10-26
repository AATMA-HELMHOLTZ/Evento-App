import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/Buttons.dart';
import 'package:flutter_app/Widgets/InputField.dart';
import 'package:flutter_app/sidebar/sidebar_layout.dart';
import 'package:page_transition/page_transition.dart';

import 'SignUp.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  TextEditingController userController;
  TextEditingController passController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Login To Continue",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFB056674)
                        ),
                      ),
                    ),
                    InputWithIcon(
                      icon: Icons.email,
                      hint: "Enter Email...",
                      mailController: userController,
                    ),
                    SizedBox(height: 20,),
                    PassWithIcon(
                      icon: Icons.vpn_key,
                      hint: "Enter Password...",
                      passwordController: passController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.error,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                });
                              },
                              child: Text("Forgot Password",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[700]
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: const EdgeInsets.all(20)),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push(context, PageTransition(type: PageTransitionType.scale, child: SideBarLayout()));
                        });
                      },
                      child: PrimaryButton(
                        btnText: "Login",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: signup()));
                        });
                      },
                      child: OutlineBtn(
                        btnText: "Create New Account",
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
