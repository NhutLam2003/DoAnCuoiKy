import 'package:flutter/material.dart';
import '../services/data.dart';
import '../models/model_item_list.dart';
class TinTuc extends StatefulWidget {
  const TinTuc({super.key,required this.link_rss});
  final String link_rss;
  @override
  State<TinTuc> createState() => _TinTucState();
}

class _TinTucState extends State<TinTuc> {
  List<Map<String, String>> newsList = [];
  final NewsDataFetcher newsDataFetcher = NewsDataFetcher();
   @override
  void initState() {
    super.initState();
    fetchNewsData();
  }
   void fetchNewsData() async {
    var fetchedNewsList = await newsDataFetcher.fetchNewsData(widget.link_rss);
    setState(() {
      newsList = fetchedNewsList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          var newsItem = newsList[index];
          var title = newsItem['title'];
          var imageLink = newsItem['image'];
          var link = newsItem['link'];
          print(link);
          return CustomItem_List(img: imageLink.toString(), title: title.toString(),link: link.toString(),);
        },
      ),
    );
  }
}