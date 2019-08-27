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
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              new BoxShadow(
                color: Colors.grey[900],
                blurRadius: 5.0,
              ),
            ],
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.softLight),
              //image: ExactAssetImage('assets/odiyan.png'),
              image: new NetworkImage(image),
              fit: BoxFit.cover),
            ),
            // border: Border.all(
            //   color: Colors.black,
            //   width: 1.0,
            // ),
          margin: EdgeInsets.symmetric(horizontal: 10.0),            
          ),
          //child: Text(name, style: TextStyle(color: Colors.white),),
        ),
      );
  }
}
