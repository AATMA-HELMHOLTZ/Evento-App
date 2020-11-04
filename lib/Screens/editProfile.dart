import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/sidebar/sidebar_layout.dart';
import 'package:page_transition/page_transition.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
         leading: IconButton(
           onPressed: (){
             Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: SideBarLayout()));
           },
           icon: Icon(Icons.arrow_back),
           color: Color(0xFFB056674),
         ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: Color(0xFFB056674),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Container(
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Text("Edit Profile",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          boxShadow: [new BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0,10)
                          )],
                          border: Border.all(
                            width: 4,
                            color: Color(0xFFB056674)
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/Anniversary.jpg"),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFB056674),
                              border: Border.all(
                                  width: 2,
                                  color: Colors.white
                              ),
                              shape: BoxShape.circle
                              ),
                             child: Icon(
                                Icons.edit,
                                color: Colors.white,),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                buildTextField("Full Name", "Tejas Hirawat", false),
                SizedBox(
                  height: 35,
                ),
                buildTextField("Email Address", "apurva12@gmail.com", false),
                SizedBox(
                  height: 35,
                ),
                buildTextField("Password", "*******", true),
                SizedBox(
                  height: 35,
                ),
                buildTextField("City Name", "New Delhi", false),
                SizedBox(
                  height: 35,
                ),
                buildTextField("Phone Number", "99900883372",false),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      child: Text("CANCEL",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black)),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: Color(0xFFB056674),
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  TextField buildTextField(String labeltext, String placeHolder, bool ispasswordField)
  {
    return TextField(
      decoration: InputDecoration(
          suffixIcon: ispasswordField ? IconButton(
            onPressed: (){
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: Icon(Icons.remove_red_eye),
            color: Colors.grey,
          ): null,
          contentPadding: EdgeInsets.only(bottom: 3),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labeltext,
          hintText: placeHolder,
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black.withOpacity(0.7)
          )
      ),
      obscureText: ispasswordField ? showPassword : false,
    );
  }
}
