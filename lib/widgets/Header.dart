import 'package:flutter/material.dart';
import 'package:graphqlapp/widgets/AppTitle.dart';

//mobx store
import './../store/language.dart';

class Header {

  final Language lang = Language(); // language instance of the mobx store

  getHeader(BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: Colors.white,
      title: AppTitle(),
      elevation: 0.0,
      actions: <Widget>[
        
        IconButton(
          icon: Icon(Icons.tune, size: 30, color: Colors.black),
          onPressed: (){
            lang.toggleLang();
          },
        ),
        
      ],
    );
  }
}
