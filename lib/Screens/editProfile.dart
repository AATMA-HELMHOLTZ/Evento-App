import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/user.dart';
//import 'dart:io';
import 'dart:io';
import 'package:flutter_app/Screens/settingsPage.dart';
import 'package:flutter_app/Services/networkHandler.dart';
import 'package:flutter_app/sidebar/sidebar_layout.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool showPassword = false;
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final passController = TextEditingController();
  final cityController = TextEditingController();
  final numController = TextEditingController();
  PickedFile imagefile = null;
  final ImagePicker picker = ImagePicker();

  NetworkHandler networkHandler = NetworkHandler();
  ProfileModel profileModel = ProfileModel();
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  void fetchData() async {
    var response = await networkHandler.get("/api/v1/user/get");
    setState(() {
      profileModel = ProfileModel.fromJson(response["data"]);
      //circular = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    void takePhoto (ImageSource source) async{

      final pickedfile = await picker.getImage(
          source: source);
      setState(() {
        imagefile = pickedfile;
      });
    }
    // ignore: non_constant_identifier_names
    Widget BottomSheet()
    {
      return Container(
        height: 100,
        width: width,
        margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20
        ),
        child: Column(
          children: [
            Text("Choose your Profile Picture",style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton.icon(onPressed: (){
                  takePhoto(ImageSource.camera);
                },
                    icon: Icon(
                        Icons.camera_alt_rounded
                    ), label: Text("Camera")),
                FlatButton.icon(onPressed: (){
                  takePhoto(ImageSource.gallery);
                },
                    icon: Icon(
                        Icons.image
                    ), label: Text("Gallery"))
              ],
            )
          ],
        ),
      );
    }

    // ignore: non_constant_identifier_names
    Widget ImageProfile()
    {
      return Stack(
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
                    // imagefile == null ?
                    // AssetImage("assets/images/Anniversary.jpg") :
                    // FileImage(File(imagefile.path)),
                    fit: BoxFit.cover
                )
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: (){
                  //Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom, child: ProfilePic()));
                  showModalBottomSheet(
                      context: context,
                      builder: ((builder) => BottomSheet()));
                },
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
                ),
              ))
        ],
      );
    }
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
            onPressed: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: SettingsPage()));
            },
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
                  child: ImageProfile(),
                ),
                SizedBox(
                  height: 35,
                ),
                buildTextField("Full Name", profileModel.name, false, nameController),
                SizedBox(
                  height: 35,
                ),
                buildTextField("Email Address", profileModel.username, false, mailController),
                SizedBox(
                  height: 35,
                ),
                buildTextField("Password", '*********', true, passController),
                SizedBox(
                  height: 35,
                ),
                buildTextField("City Name", profileModel.city, false, cityController),
                SizedBox(
                  height: 35,
                ),
                buildTextField("Phone Number", profileModel.mobile.toString(),false, numController),
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
                      onPressed: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: SideBarLayout()));
                      },
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
  TextField buildTextField(String labeltext, String placeHolder, bool ispasswordField, TextEditingController txtController)
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
      controller: txtController,
    );
  }
}


