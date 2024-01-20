import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_application_1/services/slider_data.dart';
import '../models/model_slider.dart';
import '../models/item_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Tin_Nong extends StatefulWidget {
  const Tin_Nong({super.key});

  @override
  State<Tin_Nong> createState() => _Tin_NongState();
}

class _Tin_NongState extends State<Tin_Nong> {
  int index = 0;
  List<SliderModel> _slider = [];
  List<Widget> item_lst = const [
    CustomItem_List(
        img: "https://i1-giaitri.vnecdn.net/2024/01/20/huye-n-baby-top.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=AqYrjHUiJGsnQ894TvASbw",
        title: "Mẫu ảnh hot nhất năm 2023 kbfa uv fiu"),
    CustomItem_List(
        img: "https://i1-giaitri.vnecdn.net/2024/01/20/huye-n-baby-top.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=AqYrjHUiJGsnQ894TvASbw", title: "Mẫu ảnh hot nhất năm 2023"),
    CustomItem_List(
        img: "https://i1-giaitri.vnecdn.net/2024/01/20/huye-n-baby-top.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=AqYrjHUiJGsnQ894TvASbw", title: "Mẫu ảnh hot nhất năm 2023"),
    CustomItem_List(
        img: "https://i1-giaitri.vnecdn.net/2024/01/20/huye-n-baby-top.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=AqYrjHUiJGsnQ894TvASbw", title: "Mẫu ảnh hot nhất năm 2023"),
  ];
  @override
  initState() {
    _slider = getSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 0, 5),
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
          CarouselSlider.builder(
            itemCount: _slider.length,
            itemBuilder: (context, index, realIndex) {
              String? name = _slider[index].name;
              String? img = _slider[index].img;
              print("img: ${img}");
              return Item(img!, index, name.toString());
            }, // các phần tử được thêm vào Carousel
            options: CarouselOptions(
                height: 200, // Chiều cao của Carousel
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
          const Padding(padding: EdgeInsets.all(10)),
          AnimatedSmoothIndicator(
            activeIndex: index,
            count: _slider.length,
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

  //// tạo Item cho phần đọc nhiều
  Widget Item(String img, int index, String name) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              img,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 250,
            ),
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


