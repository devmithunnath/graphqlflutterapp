import 'package:flutter/material.dart';
import './../../Models/LangModel.dart';

class LanguageSelector extends StatefulWidget {
  LanguageSelector({Key key}) : super(key: key);

  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  
  int _currLangVal = 1;
  String _currLangText = ''; 

  List<LangModel> _langGroup = [
    LangModel(
      text: "English",
      index: 1,
    ),
    LangModel(
      text: "Malayalam",
      index: 2,
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(
         child:Column(
              children: _langGroup
                  .map((t) => RadioListTile(
                        title: Text("${t.text}"),
                        groupValue: _currLangVal,
                        value: t.index,
                        onChanged: (val) {
                          print(val.index);
                          print(t.text);
                          setState(() {
                            _currLangVal = t.index;
                            _currLangText = t.text;
                          });
                        },
                      ))
                  .toList(),
            ),
         ),
    );
  }
}