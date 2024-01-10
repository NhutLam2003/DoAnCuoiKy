

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'dart:core';
import './tin_moi.dart';
import './tin_nong.dart';
import './video.dart';
import './tin_bong_da.dart';
class TrangChu extends StatefulWidget {
  const TrangChu({super.key});

  @override
  State<TrangChu> createState() => _TrangChuState();
}

class _TrangChuState extends State<TrangChu> {
  // Khai báo biến 
  int page_index = 0;
  int dem = 0;
  late DateTime cur;
  late String thu;

  // Danh cách các trang chức năng
  List<Widget> _pageCN =  [
    Video(),
  ];
  // Xử lý sự kiện onTap chuyển trang 
  void onItemPage(int index){
    setState(() {
      page_index = index;
    });

    if(index == 0){
      Navigator.push(this.context,MaterialPageRoute(builder: (context) => TrangChu()));
    }
    else if(index == 1){
      Navigator.push(this.context,MaterialPageRoute(builder: (context) => Video()));
    }
  }
  @override
  void initState() {
    super.initState();
    cur = DateTime.now();
    thu = layThu(cur.weekday);
  }
  // Xử lý hiển thị ngày hệ thống
  String layThu(int ngay) {
    switch (ngay) {
      case 1:
        return '2';
      case 2:
        return '3';
      case 3:
        return '4';
      case 4:
        return '5';
      case 5:
        return '6';
      case 6:
        return '7';
      case 7:
        return 'CN';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Lấy thứ của hệ thống
    String CH_Ngay = thu == 'CN'
        ? '${thu}, ${cur.day} tháng ${cur.month}, ${cur.year}'
        : 'T${thu}, ${cur.day} tháng ${cur.month}, ${cur.year}';
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            toolbarHeight: 95,
            title: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: IconButton(
                          icon: const Icon(
                            Icons.menu,
                            size: 25,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              dem++;
                            });
                          }),
                    ),
                    const Expanded(
                      child: TabBar(
                          indicatorColor: Colors.white,
                          isScrollable: true,
                          indicatorPadding: EdgeInsets.symmetric(vertical: 5),
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: <Widget>[
                            Tab(text: "Nóng"),
                            Tab(text: "Mới"),
                            Tab(text: "Bóng đá VN"),
                            // Tab(text: "Bóng đá TQ"),
                            // Tab(text: "Độc & lạ"),
                            // Tab(text: "Tình yêu"),
                            // Tab(text: "Giải trí"),
                            // Tab(text: "Thế giới"),
                            // Tab(text: "Pháp luật"),
                            // Tab(text: "Công nghệ"),
                            // Tab(text: "Ẩm thực"),
                          ]),
                    ),
                    const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                    const IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.account_circle_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(7, 10, 7, 0),
                      child: const Icon(Icons.date_range_outlined),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                      child: Text(
                        CH_Ngay,
                        style: const TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              Tin_Nong(),
              Tin_Moi(),
              Tin_Bong_Da()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 15,
            unselectedFontSize: 12,
            items: const[
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper),
                label: "Tin Tức",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_library_rounded),
                label: "Video",
                
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.trending_up),
                label: "Xu Hướng",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Tiện Ích",
              )
            ],
            currentIndex: page_index,
            onTap: onItemPage,
            elevation: 5
          ),
        ));
  }
}
