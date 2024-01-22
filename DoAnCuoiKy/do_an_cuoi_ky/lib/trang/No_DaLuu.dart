import 'package:flutter/material.dart';
import 'package:flutter_application_1/Thong_tin_Tai_khoan.dart';

class No_TinDaLuu extends StatefulWidget {
  const No_TinDaLuu({super.key});

  @override
  State<No_TinDaLuu> createState() => _No_TinDaLuuState();
}

class _No_TinDaLuuState extends State<No_TinDaLuu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Đã Lưu",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace_sharp),
          color: Colors.black,
          iconSize: 40,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>TaiKhoan()));
          },
        ),
        backgroundColor: Colors.grey[300],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.article_outlined,
                size: 80,
                color: Colors.black,
              ),
              SizedBox(width: 5),
              Text(
                "Không có tin nào ",
                style: TextStyle(fontSize: 20),
              )
            ],
          )
        ],
      ),
    ));
  }
}
