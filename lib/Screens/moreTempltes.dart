import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/templateView.dart';
import 'package:flutter_app/Services/networkHandler.dart';
import 'package:page_transition/page_transition.dart';


class MoreTemp extends StatefulWidget {

  @override
  _MoreTempState createState() => _MoreTempState();
}

class _MoreTempState extends State<MoreTemp> {
  List events = [];

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
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Templates'),
          backgroundColor: Color(0xFFB056674),
        ),
        body: events == null ? Container(
          child: Center(
            child: Text('L O A D I N G . . . ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40
              ),),
          ),
        ):Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: GridView.builder(
              itemCount: events.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                itemBuilder: (context,index){
                  return Card(
                    child: Hero(
                        tag: events[index],
                        child: Material(
                          child: InkWell(
                            child: GridTile(
                              footer: Container(
                                color: Colors.white,
                                child: ListTile(
                                  leading: Text(events[index]['nameOfEvent'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  trailing: IconButton(
                                    onPressed: (){
                                      Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: ColorList(ind: index,)));
                                    },
                                    icon: Icon(Icons.chevron_right),
                                    color: Color(0xFFB056674),
                                    autofocus: true,
                                  ),
                                ),
                              ),
                                child: Image.network(events[index]['image'],fit: BoxFit.fitWidth,),
                            ),
                          ),
                        )),
                  );
                }),
          ),
        ),
    );
  }
}

