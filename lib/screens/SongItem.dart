import 'package:flutter/material.dart';
import 'package:graphqlapp/widgets/Header.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
//import '../queries.dart' as queries;

class SongItem extends StatelessWidget {
  const SongItem({this.tagName, this.songId, key}) : super(key: key);

  final String tagName;
  final String songId;

  //final dynamic getSongDetails = queries.getSongDetailsMA;

  @override
  Widget build(BuildContext context) {
    final dynamic getSongDetails = '''
      query getSongDetailsMA {
        song(id: "$songId") {
          songDetails {
            coverImageMobile {
              sourceUrl
            }
            nameEnglish
            nameMalayalam
            songEnglish
            songMalayalam
          }
        }
      }
    ''';

    return Scaffold(
      appBar: new Header().getHeader(context),
      body: Query(
        options: QueryOptions(document: getSongDetails, pollInterval: 20),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (result.hasErrors) {
            return Text('\nErrors:\n ' + result.errors.join(',\n '));
          }

          String heroImage = result.data["song"]["songDetails"]
              ["coverImageMobile"]["sourceUrl"];
          String songTitle = result.data["song"]["songDetails"]["nameEnglish"];
          String songLyrics = result.data["song"]["songDetails"]["songEnglish"];

          return ListView(
            children: <Widget>[
              Container(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  child: Hero(
                    tag: tagName,
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        child: Center(
                          child: Text(
                            songTitle,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0),
                          ),
                        ),
                        height: 150.0,
                        width: MediaQuery.of(context).size.width - 100.0,
                        decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                                begin: FractionalOffset.bottomRight,
                                end: FractionalOffset.topLeft,
                                colors: [
                                  Colors.red,
                                  Colors.black,
                                ]),
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.blue,
                            image: DecorationImage(
                                image: new NetworkImage(heroImage),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Song: ' + songTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Lyrics\n\n' + songLyrics,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
