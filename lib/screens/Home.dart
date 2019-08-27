// Packages
import 'package:flutter/material.dart';

//Widgets
import 'package:graphqlapp/widgets/Header.dart';
import './../widgets/Texts/Heading.dart';
import './../widgets/Carousels/Songs.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new Header().getHeader(context),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          physics: const AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            Heading(title: 'Latest Songs', align: TextAlign.left,),
            SongsCarousel(),
          ],
        ));
  }
}
