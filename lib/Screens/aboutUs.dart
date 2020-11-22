import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/FadeAnimation.dart';
import 'package:flutter_app/Screens/web.dart';
import 'package:flutter_app/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:page_transition/page_transition.dart';

class AboutUs extends StatefulWidget with NavigationStates {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    List name = ['Apurva Bhardwaj', 'Aditya Ojha', 'Teja', 'Chotu', 'Mohen'];
    List desc = ['He is the glue which binds the team together. An expert on drones and an AI enthusiast that can develop Windows applications.',
      'If creativity was a crime, then he would be in jail. The most creative person in the team, handles all the video editing and poster making.',
      'The smartest guy in the room. A really fast learner who has a strong grip on topics like penetration testing and ethical Hacking.',
      'He loves to explore new technologies and is the jack of all trades. Mostly a full stack web developer having a good knowledge on ethical hacking and drones.',
      'desc'
    ];
    List skills = ['Flutter developer','Graphic Designer','Web Developer','Teda hai par apna hai','Backend Developer'];
    List images = ['assets/images/apurva.jpeg', 'assets/images/ojha.jpeg', 'assets/images/teja.jpeg', 'assets/images/antriksh.jpg','assets/images/mohan.jpg'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text("Know About Us",
          style: TextStyle(
            color: Color(0xFFB056674),
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: GridView.builder(
                itemCount: name.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                itemBuilder: (context,index){
                  return Card(
                    child: Hero(
                        tag: name[index],
                        child: Material(
                          child: InkWell(
                            child: GridTile(
                              footer: Container(
                                color: Colors.white,
                                child: ListTile(
                                  leading: Text('Know More',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent,
                                    ),),
                                  trailing: IconButton(
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Messages()),
                                      );
                                    },
                                    icon: Icon(Icons.chevron_right),
                                    color: Colors.redAccent,
                                    autofocus: true,
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  FadeAnimation(1, CircleAvatar(
                                      backgroundImage: AssetImage(images[index]),
                                      radius: 70,
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  Text(name[index],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 27,
                                      color: Color(0xFFB056674)
                                    ),
                                  ),
                                  SizedBox(height: 30,),
                                  Text(skills[index],textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                        fontSize: 20
                                      )),
                                  SizedBox(height: 30,),
                                  Expanded(child: Text(desc[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFB056674)
                                  ),)),
                                ],
                              ),
                            ),
                          ),
                        )),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
