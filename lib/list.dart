import 'package:flutter/material.dart';

class ListWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              'LYRICHORDS',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Heading(
              title: 'Latest Movies',
            ),
            ListWidget(),
            // Heading(title: 'Old Movies',),
            // ListWidget(),
            // Heading(title: 'Classics',),
            // ListWidget(),
            // Heading(title: 'Melodies',),
            // ListWidget(),
          ],
        ));
  }
}

class Heading extends StatelessWidget {
  final String title;

  const Heading({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontWeight: FontWeight.w300,
          )),
    );
  }
}

class ListWidget extends StatelessWidget {
  final List<String> listData = [
    'Data One',
    'Data Two',
    'Data Three',
    'Data Four',
    'Data Five'
  ];
  final List<String> listImage = [
    'Data One',
    'Data Two',
    'Data Three',
    'Data Four',
    'Data Five'
  ];
  final List<String> listTitle = [
    'Data One',
    'Data Two',
    'Data Three',
    'Data Four',
    'Data Five'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      padding: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListCard(
            name: listData[index],
          );
        },
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  final String name;

  const ListCard({this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (BuildContext context) {
          return ListItemDetail(
            name: name,
          );
        }));
      },
      child: Hero(
        tag: name,
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              new BoxShadow(
                color: Colors.grey[900],
                blurRadius: 5.0,
              ),
            ],
            image: DecorationImage(
              image: ExactAssetImage('assets/odiyan.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          //child: Text(name, style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

class ListItemDetail extends StatelessWidget {
  const ListItemDetail({this.name, key}) : super(key: key);

  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[200],
          elevation: 0,
          title: Center(
            child: Text(
              'LYRICHORDS',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
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
