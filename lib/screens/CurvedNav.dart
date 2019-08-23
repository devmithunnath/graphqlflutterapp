// Packages
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

// Screens 
import './Home.dart';
import './Favourites.dart';
import './Search.dart';

class CurvedNav extends StatefulWidget {
  @override
  _CurvedNavState createState() => _CurvedNavState();
}

class _CurvedNavState extends State<CurvedNav> {

  int currentTab = 0; // keep track of active index
  
  final List<Widget> screens = [
    Home(),
    Favourites(),
    Search(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black87,
        backgroundColor: Colors.white,
        height: 55.0,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white,),
          Icon(Icons.search, size: 30, color: Colors.white,),
          Icon(Icons.bookmark, size: 30, color: Colors.white,),
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            currentTab = index;
            if( currentTab == 0 ){
              currentScreen = Home();
            } else if( currentTab == 1 ) {
              currentScreen = Search();
            } else if( currentTab == 2 ) {
              currentScreen = Favourites();
            }
          });
        },
      ),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
    );
  }
}
