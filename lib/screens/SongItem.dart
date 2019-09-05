import 'package:flutter/material.dart';
import 'package:graphqlapp/widgets/Header.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqlapp/widgets/Texts/Heading.dart';
import 'package:graphqlapp/widgets/Texts/Paragraph.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import './../store/language.dart';

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
            nameMalayalam
            songEnglish
            songMalayalam
            coverImageMobile {
              sourceUrl(size: MEDIUM_LARGE)
            }
            movie {
              ... on Movie {
                id
                movieDetails {
                  nameEnglish
                  nameMalayalam
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
                  nameMalayalam
                }
              }
            }
            ragas {
              ... on Raga {
                id
                ragaDetails {
                  nameEnglish
                  nameMalayalam
                }
              }
            }
            musicDirector {
              ... on MusicDirector {
                id
                musicDirectorDetails {
                  nameEnglish
                  nameMalayalam
                }
              }
            }
            movieDirector {
              ... on MovieDirector {
                id
                movieDirectorDetails {
                  nameEnglish
                  nameMalayalam
                }
              }
            }
            lyricist {
              ... on Lyricist {
                id
                lyricistDetails {
                  nameEnglish
                  nameMalayalam
                }
              }
            }
            casts {
              ... on Cast {
                id
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
          EdgeInsets titlePadding =
              new EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0);

          // Song Title
          String songTitleEN =
              (result.data["song"]["songDetails"]["nameEnglish"] != null)
                  ? result.data["song"]["songDetails"]["nameEnglish"]
                  : 'EMPTY';

          String songTitleMA =
              (result.data["song"]["songDetails"]["nameMalayalam"] != null)
                  ? result.data["song"]["songDetails"]["nameMalayalam"]
                  : 'EMPTY';

          // Song Lyrics
          String songLyrics =
              (result.data["song"]["songDetails"]["songEnglish"] != null)
                  ? result.data["song"]["songDetails"]["songEnglish"]
                  : 'EMPTY';

          // Movie Name
          String movieName =
              (result.data["song"]["songDetails"]["movie"] != null)
                  ? result.data["song"]["songDetails"]["movie"][0]
                      ["movieDetails"]["nameEnglish"]
                  : 'EMPTY';

          // Movie Year
          String movieYear =
              (result.data["song"]["songDetails"]["year"] != null)
                  ? result.data["song"]["songDetails"]["year"][0]["title"]
                  : 'EMPTY';

          // Music Director
          String musicDirector =
              (result.data["song"]["songDetails"]["musicDirector"] != null)
                  ? result.data["song"]["songDetails"]["musicDirector"][0]
                      ["musicDirectorDetails"]["nameEnglish"]
                  : 'EMPTY';

          // Music Director
          String movieDirector =
              (result.data["song"]["songDetails"]["movieDirector"] != null)
                  ? result.data["song"]["songDetails"]["movieDirector"][0]
                      ["movieDirectorDetails"]["nameEnglish"]
                  : 'EMPTY';

          // Lyricist
          String lyricist =
              (result.data["song"]["songDetails"]["lyricist"] != null)
                  ? result.data["song"]["songDetails"]["lyricist"][0]
                      ["lyricistDetails"]["nameEnglish"]
                  : 'EMPTY';

          // Singers
          // List<dynamic> singers = result.data["song"]["songDetails"]["singers"];

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
                            songTitleEN,
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
              SizedBox(
                height: 20.0,
              ),
              (songTitleEN != 'EMPTY')
                  ? Heading(
                      title: 'Song: ' + songTitleEN,
                      align: TextAlign.left,
                      padding: titlePadding,
                    )
                  : Container(),
              (movieName != 'EMPTY')
                  ? Heading(
                      title: 'Movie: ' + movieName,
                      align: TextAlign.left,
                      padding: titlePadding,
                    )
                  : Container(),
              (movieYear != 'EMPTY')
                  ? Heading(
                      title: 'Year: ' + movieYear,
                      align: TextAlign.left,
                      padding: titlePadding,
                    )
                  : Container(),
              (movieDirector != 'EMPTY')
                  ? Heading(
                      title: 'Movie Director: ' + movieDirector,
                      align: TextAlign.left,
                      padding: titlePadding,
                    )
                  : Container(),
              (musicDirector != 'EMPTY')
                  ? Heading(
                      title: 'Music Director: ' + musicDirector,
                      align: TextAlign.left,
                      padding: titlePadding,
                    )
                  : Container(),
              (lyricist != 'EMPTY')
                  ? Heading(
                      title: 'Lyricist: ' + lyricist,
                      align: TextAlign.left,
                      padding: titlePadding,
                    )
                  : Container(),
              SizedBox(
                height: 20.0,
              ),
              Heading(
                title: 'Song Lyrics',
                align: TextAlign.left,
                padding: titlePadding,
              ),
              (songLyrics != 'EMPTY')
                  ? Paragraph(
                      title: songLyrics,
                      align: TextAlign.left,
                      padding: titlePadding,
                    )
                  : Paragraph(
                      title: 'Lyrics Not Found!',
                      align: TextAlign.left,
                      padding: titlePadding,
                    ),
            ],
          );
        },
      ),
    );
  }
}
