import 'package:flutter/material.dart';

class Tin_Moi extends StatefulWidget {
  const Tin_Moi({super.key});

  @override
  State<Tin_Moi> createState() => _Tin_MoiState();
}

class _Tin_MoiState extends State<Tin_Moi> {
  List<Widget> item_lst =  const [
    CustomItem_List(img: "assets/img/anh1.jpg", title: "Mẫu ảnh hot nhất năm 2023"),
    CustomItem_List(img: "assets/img/anh2.png", title: "Mẫu ảnh hot nhất năm 2023"),
    CustomItem_List(img: "assets/img/anh3.png", title: "Mẫu ảnh hot nhất năm 2023"),
    CustomItem_List(img: "assets/img/anh4.png", title: "Mẫu ảnh hot nhất năm 2023"),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 900,
            child: ListView.builder(
                shrinkWrap: true,
                // physics: const BouncingScrollPhysics(),
                itemCount: item_lst.length,
                itemBuilder: (context, index) {
                  final item = item_lst[index];
                  return item;
                }),
          );
  }
}

// Custom item danh sách tin phía dưới 
class CustomItem_List extends StatelessWidget {
  const CustomItem_List({super.key, required this.img, required this.title});
  final String img;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: Card(
      child: Row(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  width: 100,
                  height: 50,
                  child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Text(title),
              const Text("VOV . 2 giờ")
            ],
          )
        ],
      )
    ),
    );
  }
}