import 'package:flutter/material.dart';
import 'package:graphqlapp/widgets/Header.dart';

class MovieHome extends StatelessWidget {
  const MovieHome({this.name, key}) : super(key: key);

  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new Header().getHeader(context),
        body: Column(
          children: <Widget>[
            Container(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300.0,
                child: Hero(
                  tag: name,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {},
                        child: Image.asset('assets/odiyan.png',
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ));
  }
}

