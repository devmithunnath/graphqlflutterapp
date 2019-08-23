import 'package:flutter/material.dart';

class Heading extends StatelessWidget {

  final String title;
  final TextAlign align;

  const Heading({ this.title, this.align });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(title,
          textAlign: align,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          )),
    );
  }
}