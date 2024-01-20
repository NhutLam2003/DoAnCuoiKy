import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/model_item_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../services/data.dart';
import '../models/model_item_list.dart';
class Tin_Nong extends StatefulWidget {
  const Tin_Nong({super.key});

  @override
  State<Tin_Nong> createState() => _Tin_NongState();
}

class _Tin_NongState extends State<Tin_Nong> {
  int index = 0;
  List<Map<String, String>> newsList = [];
  List<Map<String, String>> newsList_Noi_Bat = [];
  @override
  initState() {
    super.initState();
    fetchNewsData();
  }
   void fetchNewsData() async {
    final newsDataFetcher =  NewsDataFetcher();
    final newsDataFetcherNoiBat =  NewsDataFetcher();
    var fetchedNewsList = await newsDataFetcher.fetchNewsData('https://vnexpress.net/rss/tin-xem-nhieu.rss');
    var fetchedNewsListNoiBat = await newsDataFetcherNoiBat.fetchNewsData('https://vnexpress.net/rss/tin-noi-bat.rss');
    setState(() {
      newsList = fetchedNewsList;
      newsList_Noi_Bat = fetchedNewsListNoiBat;
    });
  } 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 0,10),
            child: Row(
              children: [
                Text("ĐỌC NHIỀU",
                    style: TextStyle(
                        color: Colors.cyan.shade300,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Roboto'))
              ],
            ),
          ),
          //////////////////////////////////////////////////////////////////
          if(newsList.isNotEmpty)
          CarouselSlider.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index, realIndex) {
              var item = newsList[index];
              String? name = item['title'];
              String? img = item['image'];
              //print("img: ${img}");
              return Item(img!, index, name.toString());
            }, // các phần tử được thêm vào Carousel
            options: CarouselOptions(
                height: 180, // Chiều cao của Carousel
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlay: true, // Tự động chuyển trang
                enlargeCenterPage: true,
                viewportFraction: 1, // phần trung tâm chỉ hiện 1 phần tử
                // autoPlayAnimationDuration: const Duration(
                //     milliseconds: 800), // Thời gian chuyển trang tự động
                // autoPlayInterval: const Duration(
                //     seconds: 3), // Thời gian chờ trước khi tự động chuyển trang
                // aspectRatio: 6.0, // Tỷ lệ khung hình
                onPageChanged: (index2, reason) {
                  setState(() {
                    index = index2;
                  });
                },
                ),
          ),
          if(newsList.isNotEmpty)
          const Padding(padding: EdgeInsets.all(5)),
          if(newsList.isNotEmpty)
          AnimatedSmoothIndicator(
            activeIndex: index ,
            count: 5,
            effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 5,
                dotColor: Colors.grey.shade200,
                activeDotColor: Colors.cyan,
                paintStyle: PaintingStyle.fill),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
          Divider(
            color: Colors.grey.shade300,
            thickness: 4.5,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 30,bottom: 10,top: 10),
                child: Text("TIN NỔI BẬT",
                      style: TextStyle(
                          color: Colors.cyan.shade300,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Roboto')),
              ),
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: newsList_Noi_Bat.length,
              itemBuilder: (context, index) {
                var item = newsList_Noi_Bat[index];
                String? title = item['title'];
                String? imgUrl = item['image'];
                String? link = item['link'];
                print('link ${link}');
                return CustomItem_List(img: imgUrl.toString(), title: title.toString(),link:link.toString());
              })
          ///////////////////////////////////////////////////////////
        ],
      ),
    );
  }

  //// tạo Item cho phần đọc nhiều
  Widget Item(String img, int index, String name){ 
    final defaultIcon = Icon(Icons.photo_size_select_actual,color: Colors.black87,);
    final imgWidget = (img!= null && img.isNotEmpty)? Image.network(
              img,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 250,
            ):defaultIcon;

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: imgWidget
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            height: 250,
            margin: const EdgeInsets.only(top: 150),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
            ),
            child: Text(name,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis  ),),
          )
        ]),
      );
}
}


