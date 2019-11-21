import 'package:flutter/material.dart';
import './../../screens/SongItem.dart';

class SongCard extends StatefulWidget {
  final String image;
  final String name;
  final String id;
  final String tagID;
  const SongCard({this.name, this.image, this.id, this.tagID});

  _SongCardState createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {

  ImageProvider backgroundImage;

  @override
  void didChangeDependencies() async{
    backgroundImage = widget.image != 'empty' 
      ? NetworkImage(widget.image)
      : NetworkImage('http://via.placeholder.com/350x150');
    await precacheImage(backgroundImage,context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    String heroTag = widget.tagID + widget.name + widget.id;

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
                  ),
                  height: 60.0,
                  width: 170.0,
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
