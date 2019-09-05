import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:graphqlapp/widgets/AppTitle.dart';
import './Dialogs/LanguageSelector.dart';

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
          onPressed: () => EasyDialog(
            closeButton: true,
            cornerRadius: 10.0,
            fogOpacity: 0.4,
            width: 280,
            height: 220,
            title: Text(
              'Preferences',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            description: Text(
              "Make your selections",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            contentList: [
              LanguageSelector(),
            ],
          ).show(context),
        ),
      ],
    );
  }
}
