import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/data.dart';
import '../mau/mau_pt_danh_sach.dart';
class TinTuc extends StatefulWidget {
  const TinTuc({super.key,required this.link_rss});
  final String link_rss;
  @override
  State<TinTuc> createState() => _TinTucState();
}

class _TinTucState extends State<TinTuc> {
  List<Map<String, String>> newsList = [];
  final NewsDuLieu newsDataFetcher = NewsDuLieu();
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
          var date = newsItem['date'];
          //print(link);
          return CustomItem_List(img: imageLink.toString(), title: title.toString(),link: link.toString(),date: chuanHoaDate(date.toString()),);
        },
      ),
    );
  }
  /// xử lý hiện ngày giờ
  String chuanHoaDate(String value) {
    final originalFormat = DateFormat('E, d MMM y H:m:s Z');
    final dateTime = originalFormat.parse(value);

    final vietnamDateFormat = DateFormat('dd/MM/yyyy');
    final vietnamDateString = vietnamDateFormat.format(dateTime);

    return vietnamDateString;
  }
}