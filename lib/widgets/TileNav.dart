import 'package:flutter/material.dart';

class TileNav extends StatelessWidget {
  const TileNav({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.44,
              margin: EdgeInsets.all(5),
              height: 60.0,
              color: Colors.green[500],
              child: Center(
                child: Text('Latest Songs'),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.44,
              margin: EdgeInsets.all(5),
              height: 60.0,
              color: Colors.amber[500],
              child: Center(
                child: Text('Latest Songs'),
              ),
            )
        ],
      ),
    );
  }
}