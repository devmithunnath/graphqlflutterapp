import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../queries.dart' as queries;

class YearTimeline extends StatefulWidget {
  YearTimeline({Key key}) : super(key: key);

  _YearTimelineState createState() => _YearTimelineState();
}

class _YearTimelineState extends State<YearTimeline> {
  final dynamic getYearQuery = queries.getAllYears;

  List<dynamic> years;

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    final year = years[i];
    return TimelineModel(
      Container(
        margin: EdgeInsets.all(20.0),
        // shape:
        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
        // clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 50.0, bottom: 50.0, left: 20.0, right: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                child: Text(
                  year["node"]["title"],
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                onTap: (){
                  print('Clicked ID: '+year["node"]["id"]);
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      iconBackground: Colors.redAccent,
      icon: Icon(Icons.ac_unit),
      position:
          i % 2 == 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
      isFirst: i == 0,
      isLast: i == years.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Query(
        options: QueryOptions(
          document: getYearQuery, // Need state Management
          pollInterval: 20,
        ),
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

          years = result.data["years"]["edges"];

          return Timeline.builder(
              itemBuilder: centerTimelineBuilder,
              itemCount: years.length,
              position: TimelinePosition.Center);
        },
      ),
    );
  }
}
