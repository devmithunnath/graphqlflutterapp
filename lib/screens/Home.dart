// Packages
import 'package:flutter/material.dart';

//Widgets
import 'package:graphqlapp/widgets/Header.dart';
import './../widgets/Texts/Heading.dart';
import './../widgets/Carousels/LatestSongs.dart';
import './../widgets/TileNav.dart';
import './../widgets/TestCard.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new Header().getHeader(context),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          physics: const AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            // TileNav(),
            // SizedBox(height: 30),
            Heading(
              title: 'Latest Songs',
              align: TextAlign.left,
              padding: EdgeInsets.only(left: 10),
            ),
            SizedBox(height: 10),
            LatestSongsCarousel(tagID: 'latest',),
            SizedBox(height: 30),
            // Heading(
            //   title: 'Latest Movies',
            //   align: TextAlign.left,
            //   padding: EdgeInsets.only(left: 10),
            // ),
            // SizedBox(height: 10),
            // LatestSongsCarousel(tagID: 'latest1',),
            // SizedBox(height: 30),
          ],
        ));
  }
}
