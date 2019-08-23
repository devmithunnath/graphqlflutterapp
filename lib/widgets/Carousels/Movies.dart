// Packages
import 'package:flutter/material.dart';
import '../Cards/ThumbnailCard.dart';

class MoviesCarousel extends StatefulWidget {

  final String title;
  final bool featured;
  final bool all;
  final String year;

  MoviesCarousel({ this.title, this.featured, this.all, this.year });

  @override
  _MoviesCarouselState createState() => _MoviesCarouselState();
}

class _MoviesCarouselState extends State<MoviesCarousel> {

  final List<String> listData = [
    'Data One',
    'Data Two',
    'Data Three',
    'Data Four',
    'Data Five'
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      padding: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return new ThumbnailCard(
            name: listData[index],
          );
        },
      ),
    );
  }
}