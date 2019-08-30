import 'package:flutter/material.dart';
import './../../screens/SongItem.dart';

class ThumbnailCard extends StatefulWidget {
  final String image;
  final String name;
  final String id;
  const ThumbnailCard({this.name, this.image, this.id});

  _ThumbnailCardState createState() => _ThumbnailCardState();
}

class _ThumbnailCardState extends State<ThumbnailCard> {

  ImageProvider backgroundImage;

  @override
  void didChangeDependencies() async{
    backgroundImage = NetworkImage(widget.image);
    await precacheImage(backgroundImage,context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    String heroTag = widget.name + widget.id;

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (BuildContext context) {
          return SongItem(
            tagName: heroTag,
            songId: widget.id,
          );
        }));
      },
      child: Hero(
        tag: heroTag,
        child: new Container(
          width: 170,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                // colorFilter: new ColorFilter.mode(
                //     Colors.green.withOpacity(0.5), BlendMode.softLight),
                //image: ExactAssetImage('assets/odiyan.png'),
                image: backgroundImage,
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
                      widget.name,
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
