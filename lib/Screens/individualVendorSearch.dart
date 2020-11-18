import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Screens/vendorProfile.dart';
import 'package:flutter_app/Services/mail.dart';
import 'package:flutter_app/Services/networkHandler.dart';
import 'package:flutter_app/sidebar/sidebar_layout.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class IndividualSearch extends StatefulWidget {
  String name;
  IndividualSearch({Key key, @required this.name}): super(key: key);
  @override
  _IndividualSearchState createState() => _IndividualSearchState(name);
}

class _IndividualSearchState extends State<IndividualSearch> {

  String name;
  String address;
  _IndividualSearchState(this.name);
  List vendors;
  NetworkHandler networkHandler = NetworkHandler();
  var response;
  var res;
  void fetchData() async {
    response = await networkHandler.get('/vendors/get/$name');
    response = response['vendors'];
    setState(() {
      vendors = response;
    });
  }
  //var res;
  //NetworkHandler networkHandler = NetworkHandler();
  void mailRequest(String address) async{
    res = await networkHandler.get('vendors/get/mail/$address',);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Color(0xFFB056674),
      ),
      body: ListView.builder(
        itemCount: vendors == null ? 1 : vendors.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 8),
              FlipCard(
                direction: FlipDirection.HORIZONTAL, // default
                front: Center(
                  child: Container(
                    margin: EdgeInsets.only(right: 15, left: 15),
                    height: 150,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(padding: const EdgeInsets.only(right: 10)),
                        CircleAvatar(
                          backgroundImage: NetworkImage(vendors[index]['images'][0]),
                          radius: 60,
                        ),
                        Padding(padding: const EdgeInsets.only(right: 6)),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(vendors == null ? 'hi' : vendors[index]['name'],
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFB056674)
                                  ),),
                              ),
                              SizedBox(height: 10,),
                              Text('Vendor Ratings ' + vendors[index]['avgStar'].toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.teal,
                                  backgroundColor: Colors.white,
                                )),
                              SizedBox(height: 10,),
                              Text('City : ' + vendors[index]['city'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.teal,
                                  backgroundColor: Colors.white,
                                ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                back: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Color(0xFFB056674).withOpacity(.7)
                      ),
                      height: 150,
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FlatButton.icon(onPressed: () {
                              Navigator.push(context, PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: VendorProfile(name: name, index: index,)));
                            },
                                color: Colors.white
                                ,
                                icon: Icon(Icons.arrow_forward_ios),
                                label: Text("Know more")),
                            FlatButton.icon(onPressed: () {
                              //mailRequest(vendors[index]['_id']);
                              Navigator.push(context, PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: SideBarLayout()));
                              _mailsent(context, vendors[index]['name']);
                              },
                                color: Colors.white,
                                icon: Icon(Icons.filter_1_outlined),
                                label: Text("Contact Directly")),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
    )
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
