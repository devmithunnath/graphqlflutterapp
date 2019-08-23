// Packages
import 'package:flutter/material.dart';
import 'package:graphqlapp/widgets/Header.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new Header().getHeader(context),
      body: Container(
        child: Center(
          child: Text('Search Screen'),
        ),
      ),
    );
  }
}
