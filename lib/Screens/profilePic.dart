import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/FadeAnimation.dart';
import 'package:flutter_app/Widgets/Buttons.dart';
import 'package:flutter_app/sidebar/sidebar_layout.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {

  PickedFile imagefile = null;
  final ImagePicker picker = ImagePicker();
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
          CircleAvatar(
            radius: 120,
            backgroundImage: imagefile == null ? 
            AssetImage("assets/images/Anniversary.jpg") :
            FileImage(File(imagefile.path)),
          )
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(bottom: 50)),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: FadeAnimation(1,Text(
                      "Add Profile Image",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFB056674)
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 30)),
                FadeAnimation(1.5,ImageProfile()),
                Padding(padding: EdgeInsets.only(bottom: 30)),
                GestureDetector(
                  onTap: (){
                    //Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom, child: ProfilePic()));
                    showModalBottomSheet(
                        context: context,
                        builder: ((builder) => BottomSheet()));
                  },
                  child: PrimaryButton(
                    btnText: "Add Profile Pic",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) => SideBarLayout()),
                              (route)=>false );
                    });
                  },
                  child: OutlineBtn(
                    btnText: "Skip and Continue",
                  ),
                )
                //BottomSheet()
              ],
            ),
          ),
        ),
      ),
    );

  }
}
