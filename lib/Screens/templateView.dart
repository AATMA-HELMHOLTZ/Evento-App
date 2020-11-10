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

class ColorList extends StatefulWidget {
  @override
  _ColorListState createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  ValueNotifier<int> _activeColorNotifier;
  ValueNotifier<int> _checkColorNotifier;

  // there are fewer accents than primaries
  final _colorCount = Colors.primaries.length - 3.0;

  @override
  void initState() {
    _activeColorNotifier = ValueNotifier(0);
    _checkColorNotifier = ValueNotifier(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Template"),
        backgroundColor: Color(0xFFB056674),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[

            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CheckItem(
                    // activeNotifier: _activeColorNotifier,
                    // checkNotifier: _checkColorNotifier,
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
  // final ValueNotifier activeNotifier;
  // final ValueNotifier checkNotifier;

  // CheckItem(
  //     {Key key, @required this.activeNotifier, @required this.checkNotifier})
  //     : super(key: key);

  @override
  _CheckItemState createState() => _CheckItemState();
}

class _CheckItemState extends State<CheckItem> {
  bool _checked = false;
  bool _selected = false;
  //
  // Color _activeColor = Colors.green;
  // Color _checkColor = Colors.black;
  //
  // @override
  // void initState() {
  //   widget.checkNotifier.addListener(() {
  //     setState(() {
  //       _checkColor = Colors.primaries[widget.checkNotifier.value];
  //     });
  //   });
  //
  //   widget.activeNotifier.addListener(() {
  //     setState(() {
  //       _activeColor = Colors.primaries[widget.activeNotifier.value];
  //     });
  //   });
  //
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: CheckboxListTile(
        title: Text('Check! Mate?'),
        value: _checked,
        activeColor: Color(0xFFB056674),
        checkColor: Colors.white,
        onChanged: (bool value) {
          setState(() {
            _checked = value;
            _selected = value;
          });
        },
        selected: _selected,
        secondary: CircleAvatar(
          backgroundImage: AssetImage("assets/images/Anniversary.jpg"),
          radius: 40,
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
