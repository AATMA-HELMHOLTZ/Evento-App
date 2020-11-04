import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/profilePic.dart';
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

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final cityController = TextEditingController();
  final numController = TextEditingController();
  final networkHandler = NetworkHandler();

  bool circular = false;
  bool validate = false;
  String errorText;
  final formKey = GlobalKey<FormState>();

  checkUser() async {
    if (emailController.text.length == 0) {
      setState(() {
        circular = false;
        validate = false;
        errorText = "Username cannot be empty";
      });
    } else {
      var response =
      await networkHandler.get("/user/checkUsername/${emailController.text}");
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
        "name": nameController.text,
        "email": emailController.text,
        "password": passController.text,
        "mobile": numController.text,
        "city": cityController.text,
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
                      icon: Icons.person_rounded,
                      hint: "Enter Your Name",
                      Controller: nameController,
                      isPasswordField: false,
                    ),
                    SizedBox(height: 20,),
                    InputWithIcon(
                      icon: Icons.email,
                      hint: "Enter Email...",
                      Controller: emailController,
                      isPasswordField: false,
                    ),
                    SizedBox(height: 20,),
                    InputWithIcon(
                      icon: Icons.vpn_key,
                      hint: "Enter Password...",
                      Controller: passController,
                      isPasswordField: true,
                    ),
                    SizedBox(height: 20,),
                    InputWithIcon(
                      icon: Icons.location_city_outlined,
                      hint: "Enter Your City",
                      Controller: cityController,
                      isPasswordField: false,
                    ),
                    SizedBox(height: 20,),
                    InputWithIcon(
                      icon: Icons.phone_android,
                      hint: "Enter Phone number",
                      Controller: numController,
                      isPasswordField: false,
                    ),
                    SizedBox(height: 20,),
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
                       //await checkUser();
                        await signMeUp();
                        if(!circular)
                          {
                            Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom, child: ProfilePic()));
                          }
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
