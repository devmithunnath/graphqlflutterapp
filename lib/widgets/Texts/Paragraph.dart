import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {

  final String title;
  final TextAlign align;
  final EdgeInsets padding;

  const Paragraph({ this.title, this.align, this.padding });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(title,
          textAlign: align,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}