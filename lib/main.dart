import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqlapp/screens/CurvedNav.dart';
import './queries.dart' as queries;
import './hero.dart';
import './list.dart';
import './screens/Nav.dart';

void main() => runApp(GraphQLApp());

class GraphQLApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final HttpLink link = HttpLink(
      uri: 'http://api.lyrichords.com/graphql',
    );

    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: InMemoryCache(),
        link: link,
      ),
    );

    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          title: 'LYRICHORDS',
          theme: ThemeData(
            fontFamily: 'Montserrat'
          ),
          home: Container(
            child: CurvedNav(),
          ),
        ),
      ),
    );

  }
}

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  final dynamic testQuery = queries.getAllSongsEN;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LYRICHORDS'),
      ),
      body: Container(
        child: Query(
          options: QueryOptions(
            document: testQuery,
            pollInterval: 4,
          ),
          builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }){
            // added VoidCallback later to fix errors on the same line
            if(result.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(result.hasErrors){
              return Text('\nErrors:\n '+result.errors.join(',\n '));
            }

            final List<dynamic> pls = result.data["songs"]["edges"];
            //final String pls = result.data['User']['name'];

            //print(result.data['User']['name']);

            return ListView.builder(
              itemCount: pls.length,
              itemBuilder: (BuildContext context, int index){
                final Map<String, dynamic> pl = pls[index];
                final String name = pl["node"]["songDetails"]["nameEnglish"];

                return ListTile(
                  title: Text('$name'),
                  trailing: Icon(Icons.thumb_up),
                  onTap: (){},
                );

              },
            );

          },
        ),
      ),
    );
  }
}