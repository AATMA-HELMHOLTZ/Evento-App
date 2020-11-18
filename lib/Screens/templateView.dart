// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_app/Screens/vendorProfile.dart';
// import 'package:page_transition/page_transition.dart';
//
// class TemplateView extends StatefulWidget {
//   @override
//   _TemplateViewState createState() => _TemplateViewState();
// }
//
// class _TemplateViewState extends State<TemplateView> {
//
//   // IndividualSearch()
//   // {
//   //
//   // }
//   @override
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Vendors"),
//         backgroundColor: Color(0xFFB056674),
//       ),
//       body: _myListView(context),
//     );
//   }
// }
// Widget _myListView(BuildContext context) {
//
//   // backing data
//   bool _onChanged = false;
//   final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria',
//     'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
//     'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
//     'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
//     'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
//     'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
//     'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
//     'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
//     'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];
//
//   return ListView.builder(
//     itemCount: europeanCountries.length,
//     itemBuilder: (context, index) {
//       return CheckboxListTile(
//           value: _onChanged,
//           onChanged: (bool _onChanged){_onChanged = !_onChanged;});
//     },
//   );
//
// }
// //Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: VendorProfile()));

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/networkHandler.dart';
import 'package:flutter_app/sidebar/sidebar_layout.dart';
import 'package:page_transition/page_transition.dart';

bool checked = false;
bool selected = false;
String title;

class ColorList extends StatefulWidget {
  @override
  _ColorListState createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  ValueNotifier<int> _activeColorNotifier;
  ValueNotifier<int> _checkColorNotifier;

  // there are fewer accents than primaries
  final _colorCount = Colors.primaries.length - 3.0;
  List events;
  NetworkHandler networkHandler = NetworkHandler();
  var response;

  void fetchData() async {
    response = await networkHandler.get('/events/get/getEvents');
    print(response);
    response = response['events'];
    print(response);
    setState(() {
      events = response;
    });
  }

  @override
  void initState() {
    _activeColorNotifier = ValueNotifier(0);
    _checkColorNotifier = ValueNotifier(0);
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Template"),
        backgroundColor: Color(0xFFB056674),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Center(
              child: Card(
                child: Container(
                  width: width - 20,
                  height: 150,
                  child: Center(
                      child: CheckboxListTile(
                        title: Text('Select All',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),
                        value: checked,
                        activeColor: Colors.white,
                        checkColor: Color(0xFFB056674),
                        onChanged: (bool value) {
                          setState(() {
                            checked = value;
                            selected = value;
                          });
                        },
                        selected: selected,
                        secondary: IconButton(
                            icon: Icon(Icons.outgoing_mail),
                            color: Colors.white,
                            onPressed: (){
                              Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: SideBarLayout()));
                            }),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),),
                  decoration: BoxDecoration(
                      color: Color(0xFFB056674),
                      border: Border.all(
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    child: CheckboxListTile(
                      title: Text(events[1]['servicesOffered'][index]),
                      value: checked,
                      activeColor: Color(0xFFB056674),
                      checkColor: Colors.white,
                      onChanged: (bool value) {
                        setState(() {
                          checked = value;
                          selected = value;
                        });
                      },
                      selected: selected,
                      secondary: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/Anniversary.jpg"),
                        radius: 40,
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckItem extends StatefulWidget {
  // bool checked;
  // bool selected;
  //
  // CheckItem(
  //     this.checked,
  //     this.selected
  //     )

  @override
  _CheckItemState createState() => _CheckItemState();
}

class _CheckItemState extends State<CheckItem> {

  //CheckItem checkItem = CheckItem(checked, selected);


  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: CheckboxListTile(
        title: Text(''),
        value: checked,
        activeColor: Color(0xFFB056674),
        checkColor: Colors.white,
        onChanged: (bool value) {
          setState(() {
            checked = value;
            selected = value;
          });
        },
        selected: selected,
        secondary: CircleAvatar(
          backgroundImage: AssetImage("assets/images/Anniversary.jpg"),
          radius: 40,
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
