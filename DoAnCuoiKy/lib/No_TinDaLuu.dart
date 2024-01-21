import 'package:flutter/material.dart';
import 'package:trang_ca_nhan/CaNhan.dart';

class No_TinDaTai extends StatefulWidget {
  const No_TinDaTai({super.key});

  @override
  State<No_TinDaTai> createState() => _No_TinDaTaiState();
}

class _No_TinDaTaiState extends State<No_TinDaTai> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tin đã lưu",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.keyboard_backspace_sharp),
            iconSize: 40,
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CaNhan()));
            },
          ),
          backgroundColor: Colors.grey[300],
        ),
        body: const Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "CHUYÊN MỤC OFFLINE",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 200),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.article_outlined,
                      size: 80,
                      color: Colors.black,
                    ),
                    Text(
                      "Không có tin nào ",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
