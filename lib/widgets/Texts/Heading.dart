import 'package:flutter/material.dart';

class Heading extends StatelessWidget {

  final String title;
  final TextAlign align;
  final EdgeInsets padding;

  const Heading({ this.title, this.align, this.padding });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(title,
          textAlign: align,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}