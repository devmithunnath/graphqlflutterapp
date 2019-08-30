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

  final dynamic testQuery = queries.getAllSongsEN; 
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
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
                final String id = pl["node"]["id"];
                return new ThumbnailCard(
                  image: image,
                  name: name,
                  id: id,
                );

              },
            );

        },
      ),
    );
  }
}