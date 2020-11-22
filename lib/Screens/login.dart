import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/Buttons.dart';
import 'package:flutter_app/Widgets/InputField.dart';
import 'package:flutter_app/sidebar/sidebar_layout.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../Services/networkHandler.dart';
import 'signUp.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  final userController = TextEditingController();
  final passController = TextEditingController();
  NetworkHandler networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  bool validate = false;
  bool circular = false;
  bool result = false;
  String type = 'error';
  String errorText;

  logMeIn() async {
    Map<String, String> data = {
      "username": userController.text,
      "appPassword": passController.text,
    };
    var response = await networkHandler.post("/api/v1/user/login", data);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> output = json.decode(response.body);


      storage.write(key: "token", value: output["token"]);
      print(output["token"]);
      setState(() {
        validate = true;
        circular = false;
      });
    } else {
      result=true;
      setState(() {
        validate = false;
        errorText = "Incorrect email/password combination";
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
                      Controller: userController,
                      isPasswordField: false,
                    ),
                    SizedBox(height: 20,),
                    InputWithIcon(
                      icon: Icons.vpn_key,
                      hint: "Enter Password...",
                      Controller: passController,
                      isPasswordField: true,
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
                      onTap: () async {
                        setState(() {
                          circular = true;
                        });
                        await logMeIn();
                        if(validate == true && circular == false)
                        {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) => SideBarLayout()),
                                  (route)=>false );
                        }
                        else{
                          _onButtonError(context);
                        };

                      },
                      child: circular ? CircularProgressIndicator() : PrimaryButton (
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
//Alert Dialog box
_onButtonError(context) {
  Alert(
    context: context,
    type: AlertType.error,
    title: "Login Failed",
    desc: "Try Again with correct credentials",
    buttons: [
      DialogButton(
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => login(),
          ),
        ),
        width: 120,
      )
    ],
  ).show();}
