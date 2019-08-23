import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {

  final String title;
  final double barHeight = 66.0;

  MyAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: new Center(
        child: new Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 36.0
            )
        ),
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [
              const Color(0xFFA655E6),
              const Color(0xFF7034f7)
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 0.5],
            tileMode: TileMode.clamp
        ),
      ),
    );
  }
}

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            // leading: Icon(FontAwesomeIcons.bars,
            //   color: Colors.white,
            // ),
            title: Text("Address Book"),
            actions: <Widget>[
              // IconButton(
              //     icon: Icon(FontAwesomeIcons.solidAddressBook), onPressed: () {
              //   //
              // }),
            ],
            bottom: TabBar(
              tabs: [
                Tab(child: Text(
                    'FAVORITES', style: TextStyle(color: Colors.white)),),
                Tab(child: Text('ALL', style: TextStyle(color: Colors.white)),),
              ],
            ),
          ),
          body: Container(
            child: Center(
              child: Text('TEST'),
            ),
          ),
    );
  }
}