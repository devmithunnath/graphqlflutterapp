//Packages
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Lyrich', style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black87
          ),),
          Text('ords', style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red[900]
          ),),
        ],
      ),
    );
  }
}