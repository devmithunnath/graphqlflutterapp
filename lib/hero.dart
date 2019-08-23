import 'package:flutter/material.dart';

//Hero Animator Class

class HeroAnimator extends StatelessWidget {

  final List<String> listData = ['Data One', 'Data Two', 'Data Three', 'Data Four', 'Data Five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 2,
      ),
      body: Center(
        child: HeroItem(
          photo: 'assets/odiyan.png',
          width: 100.0,
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return HeroWrapper();
              }
            ));
          },
        ),
      ),
    );
  }
}


// Hero Item Wrapper when closed

class HeroWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                  appBar: AppBar(
                    title: const Text('Flipper Page'),
                    backgroundColor: Colors.lightBlueAccent,
                    elevation: 0,
                  ),
                  body: Container(
                    color: Colors.lightBlueAccent,
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.topLeft,
                    child: HeroItem(
                      photo: 'assets/odiyan.png',
                      width: MediaQuery.of(context).size.width,
                      // onTap: (){
                      //   Navigator.of(context).pop();
                      // },
                    ),
                  ),
                );
  }
}


// Hero Item when closed - Class 

class HeroItem extends StatelessWidget {

  const HeroItem({ Key key, this.photo, this.onTap, this.width }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.cover
            )
          ),
        ),
      ),
    );
  }
}