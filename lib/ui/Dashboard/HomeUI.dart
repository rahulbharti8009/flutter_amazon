import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';


import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Future<Album> fetchAlbum() async {
//   final response = await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class Album {
//   final int userId;
//   final int id;
//   final String title;

//   const Album({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return switch (json) {
//       {
//         'userId': int userId,
//         'id': int id,
//         'title': String title,
//       } =>
//         Album(
//           userId: userId,
//           id: id,
//           title: title,
//         ),
//       _ => throw const FormatException('Failed to load album.'),
//     };
//   }
// }

// Widget chartToRun() {
//    LabelLayoutStrategy? xContainerLabelLayoutStrategy;
//   ChartData chartData;
//   ChartOptions chartOptions = const ChartOptions();
//   // Example shows an explicit use of the DefaultIterativeLabelLayoutStrategy.
//   // The xContainerLabelLayoutStrategy, if set to null or not set at all,
//   //   defaults to DefaultIterativeLabelLayoutStrategy
//   // Clients can also create their own LayoutStrategy.
//   xContainerLabelLayoutStrategy = DefaultIterativeLabelLayoutStrategy(
//   options: chartOptions,
//   );
//   chartData = ChartData(
//   dataRows: const [
//   [10.0, 20.0, 5.0, 30.0, 5.0, 20.0],
//   [30.0, 60.0, 16.0, 100.0, 12.0, 120.0],
//   [25.0, 40.0, 20.0, 80.0, 12.0, 90.0],
//   [12.0, 30.0, 18.0, 40.0, 10.0, 30.0],
//   ],
//   xUserLabels: const ['Wolf', 'Deer', 'Owl', 'Mouse', 'Hawk', 'Vole'],
//   dataRowsLegends: const [
//   'Spring',
//   'Summer',
//   'Fall',
//   'Winter',
//   ],
//   chartOptions: chartOptions,
//   );
//   // chartData.dataRowsDefaultColors(); // if not set, called in constructor
//   var verticalBarChartContainer = VerticalBarChartTopContainer(
//     chartData: chartData,
//     xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
//   );

//   var verticalBarChart = VerticalBarChart(
//     painter: VerticalBarChartPainter(
//       verticalBarChartContainer: verticalBarChartContainer,
//     ),
//   );
//   return verticalBarChart;
// }

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'code': int userId,
        'id': int id,
        'title': String title,
      } =>
        Album(
          userId: userId,
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
 late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
 
  @override
  Widget build(BuildContext context) {
    return  Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        );
  }
}
