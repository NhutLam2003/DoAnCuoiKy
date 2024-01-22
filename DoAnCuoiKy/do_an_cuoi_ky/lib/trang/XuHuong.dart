import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/trang/chi_tiet.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_1/mau/mau_pt_danh_sach.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../services/data.dart';
import 'package:flutter_application_1/trang/chan_trang.dart';
import 'package:intl/intl.dart';
class XuHuong extends StatefulWidget {
  XuHuong({super.key});


  @override
  State<XuHuong> createState() => _XuHuongState();
}

class _XuHuongState extends State<XuHuong> {
  int index = 0;
  List<Map<String, String>> newsList = [];
  List<Map<String, String>> newsList_Noi_Bat = [];
  @override
  initState() {
    super.initState();
    fetchNewsData();
  }
   void fetchNewsData() async {
    final newsDataFetcher =  NewsDuLieu();
    final newsDataFetcherNoiBat =  NewsDuLieu();
    var fetchedNewsList = await newsDataFetcher.fetchNewsData('https://vnexpress.net/rss/tin-xem-nhieu.rss');
    var fetchedNewsListNoiBat = await newsDataFetcherNoiBat.fetchNewsData('https://vnexpress.net/rss/tin-noi-bat.rss');
    setState(() {
      newsList = fetchedNewsList;
      newsList_Noi_Bat = fetchedNewsListNoiBat;
    });
  } 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Xu hướng',
            style: TextStyle(
                color: Colors.white),
          ),
          centerTitle: true,
        backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          // child: Column(
          //   children: List.generate(
          //     50,
          //     (index) => ListTile(
          //       title: Text('data ${index + 1}'),
          //     ),
          //   ),
          // ),
           child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: newsList_Noi_Bat.length,
              itemBuilder: (context, index) {
                var item = newsList_Noi_Bat[index];
                String? title = item['title'];
                String? imgUrl = item['image'];
                String? link = item['link'];
                String? date = item['date'];
                //print('link ${link}');
                return CustomItem_List(img: imgUrl.toString(), title: title.toString(),link:link.toString(),date: chuanHoaDate(date.toString()));
              }),
              
        ),
        bottomNavigationBar: Bottom_Navigation()
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
