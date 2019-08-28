import 'package:flutter/material.dart';
import './../../screens/MovieHome.dart';

class ThumbnailCard extends StatelessWidget {
  final String image;
  final String name;
  const ThumbnailCard({this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (BuildContext context) {
          return MovieHome(
            name: name,
          );
        }));
      },
      child: Hero(
        tag: name,
        child: new Container(
          width: 170,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                // colorFilter: new ColorFilter.mode(
                //     Colors.green.withOpacity(0.5), BlendMode.softLight),
                //image: ExactAssetImage('assets/odiyan.png'),
                image: new NetworkImage(image),
                fit: BoxFit.cover),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    // image: DecorationImage(
                    //     image: new NetworkImage('https://c7.uihere.com/files/620/154/523/wind-wave-euclidean-vector-wave-vector-sea-background-with-abstract-waves.jpg'), 
                    //     fit: BoxFit.cover),
                  ),
                  height: 60.0,
                  width: 170.0,
                  //color: Colors.green[500],
                  child: Center(
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
