import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/networkHandler.dart';
import 'package:flutter_app/sidebar/sidebar_layout.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'FadeAnimation.dart';

class VendorProfile extends StatefulWidget {

  String name;
  int index;
  VendorProfile({Key key, @required this.name, @required this.index}): super(key: key);
  @override
  _VendorProfileState createState() => _VendorProfileState(name,index);
}

class _VendorProfileState extends State<VendorProfile> {

  _VendorProfileState(this.name, this.index);
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  String name;
  int index;
  List vendors;
  NetworkHandler networkHandler = NetworkHandler();
  var response;
  void fetchData() async {
    response = await networkHandler.get('/vendors/get/$name');
    response = response['vendors'];
    setState(() {
      vendors = response;
     // vendors = vendors.reversed.toList();
    });
  }
  var res;
  void mailRequest(String address) async{
    print("VENDOR ID" + address);
    res = await networkHandler.get('/vendors/get/mail/$address',);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: vendors == null ? Container(
        child: Center(
          child: Text('L O A D I N G . . . ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40
            ),),
        ),
      ): Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 400,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(vendors == null ? 'https://cdn.hashnode.com/res/hashnode/image/upload/v1594645715165/q01-kk5fR.png' : vendors[index]['images'][1]),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black,
                                Colors.black.withOpacity(.3)
                            ]
                          )
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeAnimation(1, Text(vendors == null ? 'Vendor' : vendors[index]['name'], style:
                            TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40)
                              ,)),
                            SizedBox(height: 20,),
                            Row(
                              children: <Widget>[
                                FadeAnimation(1.2,
                                    Text(vendors[index]['service'], style: TextStyle(color: Colors.white70, fontSize: 16),)
                                ),
                                SizedBox(width: 50,),
                                // FadeAnimation(1.3, Text(vendors[index]['service'], style:
                                // TextStyle(color: Colors.grey, fontSize: 16)
                                //   ,))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(1.6, Text(vendors[index]['description'],
                          style: TextStyle(color: Colors.black, height: 1.4),)),
                        SizedBox(height: 40,),
                        FadeAnimation(1.6,
                            Text("City", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)
                        ),
                        SizedBox(height: 10,),
                        FadeAnimation(1.6,
                            Text(vendors[index]['city'], style: TextStyle(color: Colors.black),)
                        ),
                        SizedBox(height: 20,),
                        FadeAnimation(1.6,
                            Text("Minimum Pricing", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)
                        ),
                        SizedBox(height: 10,),
                        FadeAnimation(1.6,
                            Text(vendors[index]['minPrice'].toString() + '  Onwards', style: TextStyle(color: Colors.black),)
                        ),
                        SizedBox(height: 20,),
                        FadeAnimation(1.6,
                            Text("Contact Details", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)
                        ),
                        SizedBox(height: 10,),
                        FadeAnimation(1.6,
                            Text(vendors[index]['email'] + ' , ' + vendors[index]['number'].toString(), style: TextStyle(color: Colors.black),)
                        ),
                        SizedBox(height: 20,),
                        FadeAnimation(1.6,
                            Text("Vendor Ratings", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)
                        ),
                        SizedBox(height: 20),
                        FadeAnimation(1.6,RatingBar.readOnly(
                            halfFilledColor: Color(0xFFB056674),
                            filledColor: Color(0xFFB056674),
                            initialRating: vendors[index]['avgStar'].toDouble(),
                            isHalfAllowed: true,
                            halfFilledIcon: Icons.star_half,
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                          ),
                        ),

                        SizedBox(height: 8,),
                        FadeAnimation(1.6,
                            Center(child: Text("Rated by " + vendors[index]['ratings'].length.toString() + ' users', style: TextStyle(color: Colors.black54, fontSize: 15),))
                        ),
                        SizedBox(height: 30,),
                        FadeAnimation(1.6,
                            Text("Gallery", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)
                        ),
                        SizedBox(height: 20,),
                        FadeAnimation(1.8, Container(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              makeVideo(image: vendors[index]['images'][0]),
                              makeVideo(image: vendors[index]['images'][1]),
                              makeVideo(image: vendors[index]['images'][2]),
                            ],
                          ),
                        )),
                        SizedBox(height: 50,),
                        GestureDetector(
                          onTap: (){
                            mailRequest(vendors[index]['_id']);
                            Navigator.push(context, PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: SideBarLayout()));
                            _mailsent(context, vendors[index]['name']);
                          },
                          child: Container(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: FadeAnimation(2,
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 30),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xFFB056674)
                                  ),
                                  child: Align(child: Text("Contact the Vendor", style: TextStyle(color: Colors.white),)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 70,),
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
          // Positioned.fill(
          //   bottom: 50,
          //   child: GestureDetector(
          //     onTap: (){
          //
          //     },
          //     child: Container(
          //       child: Align(
          //         alignment: Alignment.bottomCenter,
          //         child: FadeAnimation(2,
          //           Container(
          //             margin: EdgeInsets.symmetric(horizontal: 30),
          //             height: 50,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(50),
          //                 color: Color(0xFFB056674)
          //             ),
          //             child: Align(child: Text("Contact the Vendor", style: TextStyle(color: Colors.white),)),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
      floatingActionButton: Builder(
        builder: (context) => FabCircularMenu(
          key: fabKey,
          // Cannot be `Alignment.center`
          alignment: Alignment.bottomRight,
          ringColor: Colors.black87,
          ringDiameter: 500.0,
          ringWidth: 150.0,
          fabSize: 64.0,
          fabElevation: 8.0,
          fabIconBorder: CircleBorder(),
          // Also can use specific color based on wether
          // the menu is open or not:
          // fabOpenColor: Colors.white
          // fabCloseColor: Colors.white
          // These properties take precedence over fabColor
          fabColor: Colors.white,
          fabOpenIcon: Icon(Icons.star_rate, color: Color(0xFFB056674)),
          fabCloseIcon: Icon(Icons.close, color: Color(0xFFB056674)),
          fabMargin: const EdgeInsets.all(16.0),
          animationDuration: const Duration(milliseconds: 800),
          animationCurve: Curves.easeInOutCirc,
          onDisplayChange: (isOpen) {
            //_showSnackBar(context, "${isOpen ? "Rate the Vendor" : ""}");
          },
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {
                _showSnackBar(context, "You rated Very Poor");
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: Icon(Icons.looks_one, color: Colors.white),
            ),
            RawMaterialButton(
              onPressed: () {
                _showSnackBar(context, "Can be better");
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: Icon(Icons.looks_two, color: Colors.white),
            ),
            RawMaterialButton(
              onPressed: () {
                _showSnackBar(context, "Average Rated");
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: Icon(Icons.looks_3, color: Colors.white),
            ),
            RawMaterialButton(
              onPressed: () {
                _showSnackBar(context, "Good !!");
                fabKey.currentState.close();
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: Icon(Icons.looks_4, color: Colors.white),
            ),
            RawMaterialButton(
              onPressed: () {
                _showSnackBar(context, "Impressive Service !");
                fabKey.currentState.close();
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: Icon(Icons.looks_5, color: Colors.white),
            )
          ],
        ),
      ),
    );

  }

  Widget makeVideo({image}) {
    return AspectRatio(
      aspectRatio: 1.5/ 1,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover
            )
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.3)
                  ]
              )
          ),
        ),
      ),
    );
  }
}

_mailsent(context, String vname) {
  Alert(
    context: context,
    type: AlertType.success,
    title: "Mail sent",
    desc: vname + " will contact you",
    buttons: [
      DialogButton(
        child: Text(
          "Continue",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SideBarLayout(),
          ),
        ),
        width: 120,
      )
    ],
  ).show();}

void _showSnackBar(BuildContext context, String message) {
  Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 1000),
      )
  );
}

