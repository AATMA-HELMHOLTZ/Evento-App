import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/Models/vendor.dart';
import 'package:flutter_app/Screens/vendorProfile.dart';
import 'package:flutter_app/Services/networkHandler.dart';
import 'package:flutter_app/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:page_transition/page_transition.dart';

class HistoryPage extends StatefulWidget with NavigationStates {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  List vendorsCart;
  NetworkHandler networkHandler = NetworkHandler();
  var response;
  void fetchData() async {
    response = await networkHandler.get('/vendors/get/vendorsInCart');
    response = response['vendorsInCart'];
    print(response);
    setState(() {
      vendorsCart = response;
    });
  }
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return vendorsCart == null ? Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Container(
        color: Colors.white,
      ),
    ):Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text("History",
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
                itemCount: vendorsCart.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 1.45),
                itemBuilder: (context,index){
                  return Card(
                    child: Hero(
                        tag: vendorsCart[index]['_id'],
                        child: Material(
                          child: InkWell(
                            child: GridTile(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(vendorsCart[index]['images'][0]),
                                    radius: 70,
                                  ),
                                  SizedBox(width: 30,),
                                  //Text('data'),
                                  Card(
                                    child: Container(
                                      width: 180,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.white70,
                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 7,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 20,),
                                          SafeArea(
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(vendorsCart[index]['name'],
                                              style: TextStyle(
                                                color: Color(0xFFB056674),
                                                fontSize: 20
                                              ),),
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          Text('time',
                                            style: TextStyle(
                                              color: Color(0xFFB056674),
                                              fontSize: 15
                                          ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              header: Container(
                                color: Colors.white,
                                child: ListTile(
                                  leading: Text('View Profile of Vendor',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                    ),),
                                  trailing: IconButton(
                                    onPressed: (){
                                      String vname = vendorsCart[index]['service'];
                                      Navigator.push(context, PageTransition(
                                          type: PageTransitionType.bottomToTop,
                                          child: VendorProfile(name: vname, index: index,)));
                                    },
                                    icon: Icon(Icons.chevron_right),
                                    color: Colors.redAccent,
                                    autofocus: true,
                                  ),
                                ),
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
