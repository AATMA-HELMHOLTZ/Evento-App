import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(5, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
];

List<Widget> _tiles = <Widget>[
  _Example01Tile("assets/images/3.jpg"),
  _ExampleTile("assets/images/2.jpg"),
  _ExampleTile("assets/images/1.jpg"),
  _ExampleTile("assets/images/2.jpg"),
  _ExampleTile("assets/images/1.jpg"),
  _ExampleTile("assets/images/2.jpg"),
  _ExampleTile("assets/images/1.jpg"),
  _ExampleTile("assets/images/2.jpg"),
  _ExampleTile("assets/images/1.jpg"),
  _ExampleTile("assets/images/2.jpg"),
  // const _Example01Tile(Colors.lightBlue, Icons.wifi),
  // const _Example01Tile(Colors.amber, Icons.panorama_wide_angle),
  // const _Example01Tile(Colors.brown, Icons.map),
  // const _Example01Tile(Colors.deepOrange, Icons.send),
  // const _Example01Tile(Colors.indigo, Icons.airline_seat_flat),
  // const _Example01Tile(Colors.red, Icons.bluetooth),
  // const _Example01Tile(Colors.pink, Icons.battery_alert),
  // const _Example01Tile(Colors.purple, Icons.desktop_windows),
  // const _Example01Tile(Colors.blue, Icons.radio),
];


class MoreTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Templates'),
        ),
        body: new Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 4,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
            )));
  }
}

class _Example01Tile extends StatelessWidget {
  _Example01Tile(this.image);

  // final Color backgroundColor;
  // final IconData iconData;
  final String image;

  @override
  Widget build(BuildContext context) {
    return new Card(
      //color: Colors.purple,
      //     child: Column(
      //      children: [Image.asset(
      //         image,
      //         height: 130,
      //         width: 1000,
      //         alignment: Alignment.topCenter,
      // ),
      //         ButtonTheme(
      //             minWidth: 50,
      //             height: 30,
      //             child: RaisedButton(
      //                 onPressed: () { print("object");},
      //                 child: Text("Button"),
      //       ),
      //     )
      //   ],
      //   )
      child: Image.asset(
        image,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class _ExampleTile extends StatelessWidget {
  _ExampleTile(this.image);

  // final Color backgroundColor;
  // final IconData iconData;
  final String image;

  @override
  Widget build(BuildContext context) {
    return new Card(
      //color: backgroundColor,
        child: new InkWell(
          onTap: () {},
          child: new Center(
            child: new Padding(
              padding: const EdgeInsets.all(4.0),
              // child: new Icon(
              //   iconData,
              //   color: Colors.white,
              // ),
              child: Image.asset(image),
            ),
          ),
        ));
  }
}