
import 'package:flutter/material.dart';

//import './video.dart';
//import './trang_chu.dart';
class Chan_Trang extends StatefulWidget {
  const Chan_Trang({super.key});

  @override
  State<Chan_Trang> createState() => _Chan_TrangState();
}

class _Chan_TrangState extends State<Chan_Trang> {
  int page_index = 0;
  // Danh cách các trang chức năng
  List<Widget> _pageCN =  [
   // Video(),
  ];
  // Xử lý sự kiện onTap chuyển trang 
  void onItemPage(int index){
    setState(() {
      page_index = index;
    });

    if(index == 0){
      // Không dùng push bị bug giao diện
      //Navigator.pushReplacement(this.context,MaterialPageRoute(builder: (context) => TrangChu()));
    }
    else if(index == 1){
      //Navigator.pushReplacement(this.context,MaterialPageRoute(builder: (context) => Video()));
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
              )
            ],
            currentIndex: page_index,
            onTap: onItemPage,
            //backgroundColor: Colors.black38,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black54,
            elevation: 5);
  }
}