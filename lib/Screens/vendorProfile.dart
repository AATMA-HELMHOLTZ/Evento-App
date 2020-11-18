import 'package:flutter/material.dart';
import 'package:flutter_app/Services/networkHandler.dart';
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
    });
  }
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 450,
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
                        SizedBox(height: 120,)
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
          Positioned.fill(
            bottom: 50,
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
          )
        ],
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

