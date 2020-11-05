import 'package:flutter/material.dart';


class MoreTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List templates = [
      'Anniversary', 'Birthday Party','Marriage Functions '
    ];
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Templates'),
          backgroundColor: Color(0xFFB056674),
        ),
        body: Container(
          child: GridView.builder(
            itemCount: templates.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

              // ignore: missing_return
              itemBuilder: (context,index){
                return Card(
                  child: Hero(
                      tag: templates[index],
                      child: Material(
                        child: InkWell(
                          child: GridTile(
                            footer: Container(
                              color: Colors.white,
                              child: ListTile(
                                leading: Text(templates[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                                ),),
                                trailing: IconButton(
                                  onPressed: (){

                                  },
                                  icon: Icon(Icons.chevron_right),
                                  color: Color(0xFFB056674),
                                  autofocus: true,
                                ),
                              ),
                            ),
                              child: Image.asset("assets/images/Anniversary.jpg",fit: BoxFit.cover,),
                          ),
                        ),
                      )),
                );
              }),
        ),
    );
  }
}

