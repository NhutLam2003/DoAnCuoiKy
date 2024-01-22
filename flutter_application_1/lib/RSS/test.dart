// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_application_1/models/newmodel.dart';
// import 'package:xml/xml.dart' as xml;
// import 'package:webfeed/webfeed.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// class TestRss extends StatefulWidget {
//   const TestRss({super.key});

//   @override
//   State<TestRss> createState() => _TestRssState();
// }

// class _TestRssState extends State<TestRss> {
//   // Future<List<String>> fetchRSS() async {
//   //   final response =
//   //       await http.get(Uri.parse('https://vnexpress.net/rss/tin-moi-nhat.rss'));

//   //   if (response.statusCode == 200) {
//   //     final xmlDoc = xml.XmlDocument.parse(response.body);
//   //     final items = xmlDoc.findAllElements('item');
//   //     final titles =
//   //         items.map((item) => item.getElement('title')!.text).toList();
//   //     return titles;
//   //   } else {
//   //     throw Exception('Failed to fetch RSS');
//   //   }
//   // }

//   List<RssItem>? _rssItems;

//   @override
//   void initState() {
//     super.initState();
//     _fetchRss();
//   }

//   Future<void> _fetchRss() async {
//     final response =
//         await http.get(Uri.parse('https://vnexpress.net/rss/the-gioi.rss'));

//     if (response.statusCode == 200) {
//       final feed = RssFeed.parse(response.body);
//       setState(() {
//         _rssItems = feed.items;
//         //print(feed.items![0].description);
//         // img = (feed.items![0].description.toString().substring(
//         //     feed.items![0].description.toString().lastIndexOf("img src=") + 9,
//         //     feed.items![0].description.toString().lastIndexOf('>') - 11));
//       });
//     } else {
//       throw Exception('Failed to load RSS');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('VnExpress RSS'),
//       ),
//       body: _rssItems == null
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               itemCount: _rssItems!.length,
//               itemBuilder: (context, index) {
//                 final item = _rssItems![index];
//                 return Container(
//                   decoration: BoxDecoration(color: Colors.white, boxShadow: [
//                     BoxShadow(
//                         blurRadius: 2, spreadRadius: 2, color: Colors.black12)
//                   ]),
//                   child: ListTile(
//                     title: Text(item.title ?? ''),
//                     subtitle: Text(item.pubDate?.toString() ?? ''),
//                     leading: CachedNetworkImage(
//                       imageUrl: item.enclosure?.url ?? '',
//                       placeholder: (context, url) =>
//                           CircularProgressIndicator(),
//                       errorWidget: (context, url, error) => Icon(Icons.error),
//                     ),
//                     //leading: Image.network(img),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
