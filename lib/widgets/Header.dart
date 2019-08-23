import 'package:flutter/material.dart';
import 'package:graphqlapp/widgets/AppTitle.dart';


class Header {
  getHeader(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      backgroundColor: Colors.white,
      centerTitle: true, 
      title: AppTitle(),
      elevation: 0.0,
      // actions: <Widget>[
      //   Icon(Icons.menu, size: 30, color: Colors.black,)
      // ],
    );
  }
}
