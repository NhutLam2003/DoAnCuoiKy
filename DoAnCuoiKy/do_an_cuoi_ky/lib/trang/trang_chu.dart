import 'package:flutter/material.dart';
import 'dart:core';
import '../services/dulieu_chu_de.dart';
import 'chan_trang.dart';
import '../mau/mau_danh_muc.dart';
import 'trang_tin_tuc.dart';
import 'trang_tin_nong.dart';
import 'trang_tim_kiem.dart';
import 'package:flutter_application_1/Thong_tin_Tai_khoan.dart';
import 'ChuyenMuc.dart';
class Trang_Chu extends StatefulWidget {
  const Trang_Chu({super.key});

  @override
  State<Trang_Chu> createState() => _Trang_ChuState();
}

class _Trang_ChuState extends State<Trang_Chu> {
  /////// Danh sách chủ đề lấy từ data
  List<CategoryModel> _categories = [];
  /////// Khai báo biến
  late DateTime cur;
  late String thu;
  ///////
  @override
  void initState() {
    _categories = getCategories();
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
        length: _categories.length,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey,
              toolbarHeight: 90,
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
                             onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChuyenMuc()));
                        },),
                      ),
                      Expanded(
                        child: TabBar(
                            indicatorColor: Colors.white,
                            isScrollable: true,
                            indicatorPadding: EdgeInsets.symmetric(vertical: 5),
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: _categories.map((e) {
                              return Tab(text: e.name);
                            }).toList()),
                      ),
                      IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Trang_Tim_Kiem()));
                        },  
                        icon: const Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TaiKhoan()));
                        },
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
                TinTuc(link_rss:  'https://vnexpress.net/rss/the-thao.rss'),
                TinTuc(link_rss:  'https://vnexpress.net/rss/giai-tri.rss'),
                TinTuc(link_rss:  'https://vnexpress.net/rss/kinh-doanh.rss'),
              ],
            ),
            bottomNavigationBar: Bottom_Navigation()));
  }
}
