
import 'package:flutter/material.dart';
import 'trang_video.dart';
import 'trang_chu.dart';
import 'XuHuong.dart';
import 'Tien_Ich.dart';
class Bottom_Navigation extends StatefulWidget {
  const Bottom_Navigation({super.key});

  @override
  State<Bottom_Navigation> createState() => _bottom_navigationState();
}

class _bottom_navigationState extends State<Bottom_Navigation> {
  int page_index = 0;
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
      // Không dùng push bị bug giao diện
      Navigator.pushReplacement(this.context,MaterialPageRoute(builder: (context) => Trang_Chu()));
    }
    else if(index == 1){
      Navigator.pushReplacement(this.context,MaterialPageRoute(builder: (context) => Video()));
    }
    if(index == 2){
      // Không dùng push bị bug giao diện
      Navigator.pushReplacement(this.context,MaterialPageRoute(builder: (context) =>XuHuong()));
    }
    else if(index == 3){
      Navigator.pushReplacement(this.context,MaterialPageRoute(builder: (context) => Tienich()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      //fixedColor: Colors.black54,
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
              ),
            ],
            currentIndex: page_index,
            onTap: onItemPage,
            //backgroundColor: Colors.black38,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black54,
            elevation: 5);
  }
}