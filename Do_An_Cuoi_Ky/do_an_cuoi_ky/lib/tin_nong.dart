import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Tin_Nong extends StatefulWidget {
  const Tin_Nong({super.key});

  @override
  State<Tin_Nong> createState() => _Tin_NongState();
}

class _Tin_NongState extends State<Tin_Nong> {
  int index = 0;
  List<Widget> item = const [
    CustomItem(title: "Mẫu ảnh hot nhất năm 2023", img: "assets/img/anh2.png"),
    CustomItem(title: "Mẫu ảnh hot nhất năm 2023", img: "assets/img/anh4.png"),
    CustomItem(title: "Mẫu ảnh hot nhất năm 2023", img: "assets/img/anh3.png"),
    CustomItem(title: "Mẫu ảnh hot nhất năm 2023", img: "assets/img/anh1.jpg"),
  ];
  List<Widget> item_lst = const [
    CustomItem_List(
        img: "assets/img/anh1.jpg", title: "Mẫu ảnh hot nhất năm 2023 kbfa uv fiu"),
    CustomItem_List(
        img: "assets/img/anh2.png", title: "Mẫu ảnh hot nhất năm 2023"),
    CustomItem_List(
        img: "assets/img/anh3.png", title: "Mẫu ảnh hot nhất năm 2023"),
    CustomItem_List(
        img: "assets/img/anh4.png", title: "Mẫu ảnh hot nhất năm 2023"),
    CustomItem_List(
        img: "assets/img/anh4.png", title: "Mẫu ảnh hot nhất năm 2023"),
    CustomItem_List(
        img: "assets/img/anh4.png", title: "Mẫu ảnh hot nhất năm 2023"),
    CustomItem_List(
        img: "assets/img/anh4.png", title: "Mẫu ảnh hot nhất năm 2023"),
    CustomItem_List(
        img: "assets/img/anh4.png", title: "Mẫu ảnh hot nhất năm 2023"),
    CustomItem_List(
        img: "assets/img/anh4.png", title: "Mẫu ảnh hot nhất năm 2023 "),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 0, 10),
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
          CarouselSlider(
            items: item, // các phần tử được thêm vào Carousel
            options: CarouselOptions(
              autoPlay: false, // Tự động chuyển trang
              height: 200, // Chiều cao của Carousel
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(
                  milliseconds: 800), // Thời gian chuyển trang tự động
              autoPlayInterval: const Duration(
                  seconds: 3), // Thời gian chờ trước khi tự động chuyển trang
              enlargeCenterPage: true, // Phóng to trung tâm hiện tại
              aspectRatio: 6.0, // Tỷ lệ khung hình
              onPageChanged: (index2, reason) {
                setState(() {
                  index = index2;
                });
              },
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          AnimatedSmoothIndicator(
            activeIndex: index,
            count: item.length,
            effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 5,
                dotColor: Colors.grey.shade200,
                activeDotColor: Colors.cyan,
                paintStyle: PaintingStyle.fill),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
          Divider(
            color: Colors.grey.shade300,
            thickness: 4.5,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: item_lst.length,
              itemBuilder: (context, index) {
                final item = item_lst[index];
                return item;
              })
          ///////////////////////////////////////////////////////////
        ],
      ),
    );
  }
}

// Custom item Phần đọc nhiều
class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.title, required this.img});
  final String title;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Card(
        //color: Colors.black12,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                width: 200,
                height: 200,
                child: Image.asset(
                  img,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
          ],
        ));
  }
}

// Custom item danh sách tin phía dưới
class CustomItem_List extends StatelessWidget {
  const CustomItem_List({super.key, required this.img, required this.title});
  final String img;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      color: Colors.grey.shade200,
      elevation: 5,
        child: Container(
          margin: const EdgeInsets.all(20),
          color: Colors.grey.shade200,
      child: Row(
        //mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///// Chứa tấm ảnh 
          Container(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87,fontSize: 16),
                  overflow:
                      TextOverflow.visible,
                  maxLines: null, // cho phép xuống hàng khi tràn dòng
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: const Text("VOV . 2 giờ"),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
