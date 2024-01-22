import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:xml2json/xml2json.dart';

class RSSDemo extends StatefulWidget {
  const RSSDemo({super.key});

  // Future<void> fetchRssData() async {
  //   final url = 'https://vnexpress.net/rss/thoi-su.rss';
  //   final res = await http.get(Uri.parse(url));

  //   if (res.statusCode == 200) {
  //     final body = res.body;
  //     final document = xml.XmlDocument.parse(body);

  //     final items = document.findAllElements('item');
  //     for (var item in items) {
  //       final title = item.findElements('title').single.text;
  //       final description = item.findAllElements('description').single.text;

  //       print('Title: $title');
  //       print('Des: $description');
  //     }
  //   } else {
  //     print("Failed: ${res.statusCode}");
  //   }
  // }

  @override
  State<RSSDemo> createState() => _RSSDemoState();
}

class _RSSDemoState extends State<RSSDemo> {
  final Xml2Json xml2json = Xml2Json();
  List TopStories = [];
  Future NewsTopStories() async {
    final url = Uri.parse('https://vnexpress.net/rss/the-gioi.rss');
    final res = await http.get(url);
    xml2json.parse(res.body.toString());
    var jsondata = await xml2json.toGData();
    var data = json.decode(jsondata);
    TopStories = data['rss']['channel']['item'];
    print(TopStories);
    // print(
    //   TopStories[0]['media\$content']['url'],
    // );
  }

  @override
  Widget build(BuildContext context) {
    NewsTopStories();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RSS",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: FutureBuilder(
            future: NewsTopStories(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? Container(
                      height: 45,
                      width: 45,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.75,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Text(
                              'data',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              controller: ScrollController(),
                              itemCount: TopStories.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                            color: Colors.black12)
                                      ]),
                                  child: ListTile(
                                    onTap: () {},
                                    horizontalTitleGap: 10,
                                    minVerticalPadding: 10,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 10,
                                    ),
                                    title: Text(
                                      TopStories[index]['title'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // leading: Image.network(

                                    //   fit: BoxFit.cover,
                                    //   height: 80,
                                    //   width: 80,
                                    // ),
                                  ),
                                );
                              })
                        ],
                      ),
                    );
            }),
      ),
    );
  }
}
