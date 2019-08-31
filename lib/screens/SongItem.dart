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
    final dynamic getSongDetailsEN = '''
      query getSongDetailsMA {
        song(id: "$songId") {
          songDetails {
            nameEnglish
            songEnglish
            coverImageMobile {
              sourceUrl(size: MEDIUM_LARGE)
            }
            movie {
              ... on Movie {
                id
                movieDetails {
                  nameEnglish
                }
              }
            }
            year {
              ... on Year {
                id
                title
              }
            }
            singers {
              ... on Singer {
                id
                singerDetails {
                  nameEnglish
                }
              }
            }
            ragas {
              ... on Raga {
                id
                ragaDetails {
                  nameEnglish
                }
              }
            }
            musicDirector {
              ... on MusicDirector {
                id
                musicDirectorDetails {
                  nameEnglish
                }
              }
            }
            movieDirector {
              ... on MovieDirector {
                id
                movieDirectorDetails {
                  nameEnglish
                }
              }
            }
            lyricist {
              ... on Lyricist {
                id
                lyricistDetails {
                  nameEnglish
                }
              }
            }
          }
        }
      }
    ''';

    return Scaffold(
      appBar: new Header().getHeader(context),
      body: Query(
        options: QueryOptions(document: getSongDetailsEN, pollInterval: 20),
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

          // Padding 
          EdgeInsets titlePadding = new EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0);

          // Song Title
          String songTitle = result.data["song"]["songDetails"]["nameEnglish"];

          // Song Lyrics
          String songLyrics = result.data["song"]["songDetails"]["songEnglish"];

          // Movie Name
          String movieName = result.data["song"]["songDetails"]["movie"][0]["movieDetails"]["nameEnglish"];

          // Movie Year
          String movieYear = result.data["song"]["songDetails"]["year"][0]["title"];

          // Music Director
          String musicDirector = result.data["song"]["songDetails"]["musicDirector"][0]["musicDirectorDetails"]["nameEnglish"];

          // Music Director
          String movieDirector = result.data["song"]["songDetails"]["movieDirector"][0]["movieDirectorDetails"]["nameEnglish"];

          // Lyricist
          String lyricist = result.data["song"]["songDetails"]["lyricist"][0]["lyricistDetails"]["nameEnglish"];

          // Singers
          List<dynamic> singers = result.data["song"]["songDetails"]["singers"];

          // Mobile Cover Image
          String heroImage = result.data["song"]["songDetails"]
              ["coverImageMobile"]["sourceUrl"];

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
              SizedBox(height: 20.0,),
              Container(
                padding: titlePadding,
                child: Text(
                  'Song: ' + songTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: titlePadding,
                child: Text(
                  'Movie: ' + movieName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: titlePadding,
                child: Text(
                  'Year: ' + movieYear,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: titlePadding,
                child: Text(
                  'Movie Director: ' + movieDirector,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: titlePadding,
                child: Text(
                  'Music Director: ' + musicDirector,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: titlePadding,
                child: Text(
                  'Lyricist: ' + lyricist,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                padding: titlePadding,
                child: Text(
                  'Song Lyrics',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: titlePadding,
                child: Text(
                  songLyrics,
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
