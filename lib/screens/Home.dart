// Packages
import 'package:flutter/material.dart';

//Widgets 
import 'package:graphqlapp/widgets/AppTitle.dart';
import 'package:graphqlapp/widgets/Header.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new Header().getHeader(context),
      body: Container(
        child: Center(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
