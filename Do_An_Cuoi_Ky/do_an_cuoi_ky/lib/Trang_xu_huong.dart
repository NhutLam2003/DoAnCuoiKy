import 'package:flutter/material.dart';

class TrendPagState extends StatefulWidget {
  const TrendPagState({super.key});

  @override
  State<TrendPagState> createState() => __TrendPagStateState();
}

class __TrendPagStateState extends State<TrendPagState> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Xu hướng",
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Trạng thái hiện tại
        onTap: (int index) {
          // Xử lý khi người dùng chọn một tab khác
          _currentIndex = index;
          // Force widget build lại để thay đổi màn hình hiển thị
          // (hoặc sử dụng setState nếu bạn đang ở trong StatefulWidget)
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Tin tức',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up_rounded),
            label: 'Xu hướng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Tiện ích',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
