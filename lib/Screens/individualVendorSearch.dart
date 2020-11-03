import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Screens/vendorProfile.dart';
import 'package:page_transition/page_transition.dart';

class IndividualSearch extends StatefulWidget {
  @override
  _IndividualSearchState createState() => _IndividualSearchState();
}

class _IndividualSearchState extends State<IndividualSearch> {

  // IndividualSearch()
  // {
  //
  // }
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vendors"),
      ),
      body: _myListView(context),
    );
  }
}
Widget _myListView(BuildContext context) {

  // backing data
  final width = MediaQuery.of(context).size.width;
  final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria',
    'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
    'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
    'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
    'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
    'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
    'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
    'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
    'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];

  return ListView.builder(
    itemCount: europeanCountries.length,
    itemBuilder: (context, index) {
      return FlipCard(
        direction: FlipDirection.HORIZONTAL, // default
        front: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 150,
              width: width,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Row(
                children: [
                  Padding(padding: const EdgeInsets.only(right: 10)),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Anniversary.jpg"),
                    radius: 60,
                  ),
                  Padding(padding: const EdgeInsets.only(right: 10)),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Vendor",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),),
                        ),
                        Text("Vendor Ratings, Team size, wagera wagera",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.8)
                          ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        back: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.red
              ),
              height: 150,
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Back',
                      style: TextStyle(
                        fontSize: 50
                      ),),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    FlatButton.icon(onPressed: (){
                      Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: VendorProfile()));
                    },
                        color: Colors.blue,
                        icon: Icon(Icons.arrow_forward_ios),
                        label: Text("Know more")),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );

}
//Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: VendorProfile()));