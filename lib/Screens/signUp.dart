import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/Buttons.dart';
import 'package:flutter_app/Widgets/InputField.dart';
import 'package:flutter_app/networkHandler.dart';
import 'package:page_transition/page_transition.dart';

import 'login.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {

  final userController = TextEditingController();
  final passController = TextEditingController();
  final networkHandler = NetworkHandler();

  bool circular = false;
  bool validate = false;
  String errorText;
  final formKey = GlobalKey<FormState>();

  checkUser() async {
    if (userController.text.length == 0) {
      setState(() {
        circular = false;
        validate = false;
        errorText = "Username cannot be empty";
      });
    } else {
      var response =
      await networkHandler.get("/user/checkUsername/${userController.text}");
      if (response["Status"]) {
        setState(() {
          circular = false;
          validate = false;
          errorText = "Username already exists";
        });
      } else {
        setState(() {
          circular = false;
          validate = true;
        });
      }
    }
  }
  signMeUp() async {
    if (true) {
      Map<String, String> data = {
        "email": userController.text,
        "password": passController.text
      };
      print(data);
      await networkHandler.post("/api/v1/user/signup", data);
      setState(() {
        circular = false;
      });
    } else {
      setState(() {
        circular = false;
      });
    }
  }

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
                        "Create a New Account",
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
                    )
                  ],
                ),
                Padding(padding: const EdgeInsets.all(20)),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          circular = true;
                        });
//                        await checkUser();
                        await signMeUp();
                      },
                      child: circular ? CircularProgressIndicator() : PrimaryButton(

                        btnText: "Create Account",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom, child: login()));
                        });
                      },
                      child: OutlineBtn(
                        btnText: "Back To Login",
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
