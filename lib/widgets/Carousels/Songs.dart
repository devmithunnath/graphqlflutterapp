// Packages
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../Cards/ThumbnailCard.dart';
import '../../queries.dart' as queries;

class SongsCarousel extends StatefulWidget {

  final String title;
  final bool featured;
  final bool all;
  final String year;

  SongsCarousel({ this.title, this.featured, this.all, this.year });

  @override
  _SongsCarouselState createState() => _SongsCarouselState();
}

class _SongsCarouselState extends State<SongsCarousel> {

  final List<String> listData = [
    'Data One',
    'Data Two',
    'Data Three',
    'Data Four',
    'Data Five'
  ];

  final dynamic testQuery = queries.getAllSongsTitle;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      padding: EdgeInsets.only(top: 10.0),
      child: Query(
        options: QueryOptions(
          document: testQuery, // Need state Management
          pollInterval: 20,
        ),
        builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }){
          
          if( result.loading ) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(result.hasErrors){
              return Text('\nErrors:\n '+result.errors.join(',\n '));
          }

          final List<dynamic> pls = result.data["songs"]["edges"];

          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: pls.length,
              itemBuilder: (BuildContext context, int index){
                final Map<String, dynamic> pl = pls[index];
                final String name = pl["node"]["songDetails"]["nameEnglish"];
                final String image = pl["node"]["songDetails"]["coverImageMobile"]["sourceUrl"];
                // return ListTile(
                //   title: Text('$name'),
                //   trailing: Icon(Icons.thumb_up),
                //   onTap: (){},
                // );

                print('Testing Image: ---------------------'+image);

                return new ThumbnailCard(
                  image: image,
                  name: name,
                );

              },
            );

        },
      ),
      // child: ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemCount: listData.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return new ThumbnailCard(
      //       name: listData[index],
      //     );
      //   },
      // ),
    );
  }
}