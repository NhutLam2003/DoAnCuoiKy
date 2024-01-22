import 'package:flutter/material.dart';

import 'No_DaLuu.dart';
import 'No_TinDaLuu.dart';
import 'package:flutter_application_1/pages/pages_home.dart';

class ChuyenMuc extends StatefulWidget {
  const ChuyenMuc({super.key});

  @override
  State<ChuyenMuc> createState() => _ChuyenMucState();
}

class _ChuyenMucState extends State<ChuyenMuc>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  bool occ = false;
  void _iconTapped() {
    if (occ == false) {
      _animationController.forward();
      setState(() {
        occ = true;
      });
    } else {
      _animationController.reverse();
      setState(() {
        occ = false;
      });
    }
  }

  final List<String> names = [
    "Nóng",
    "Thể thao",
    "Giải trí",
    "Kinh doanh",

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Chuyên Mục",
          ),
          centerTitle: true,
          actions: [
            // IconButton(
            //   icon: const Icon(Icons.arrow_forward_sharp),
            //   color: Colors.white,
            //   onPressed: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => Home()));
            //   },
            // )
          ],
          backgroundColor: Colors.grey[400],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Thay đổi",
                    style: TextStyle(fontSize: 25),
                  ),
                  GestureDetector(
                    onTap: _iconTapped,
                    //_animationController.forward();

                    child: AnimatedIcon(
                      icon: AnimatedIcons.view_list,
                      progress: _animationController,
                      size: 60,
                    ),
                  ),
                ],
              ),
            ),
            !occ
                ? Expanded(
                    child: ListView.builder(
                      itemCount: names.length,
                      itemBuilder: (context, index) {
                        return Row(children: [
                          Text(
                            '${index + 1}',
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                          TextButton(
                            onPressed: () {
                              if (names[index] == "Nóng") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const No_TinDaLuu()));
                              } else if (names[index] == "Tin đã lưu") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const No_TinDaTai()));
                              }
                            },
                            child: Text(
                              names[index],
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ]);
                      },
                    ),
                    
                  )
                : Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: names.length,
                      itemBuilder: (context, index) {
                        return Container(
                            // width: 20,
                            // height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[300],
                            ),
                            margin: EdgeInsets.all(8),
                            child: ListTile(
                              onTap: () {
                                if (names[index] == "Đã lưu") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const No_TinDaLuu()));
                                }
                              },
                              title: Center(child: boxChuyenMuc(names[index])),
                            ));
                      },
                    ),
                  ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Column(
              children: [
                 Row(
                  children: [
                    Text(
                      "Nguồn Tin Nổi Bật",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 1),
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                          ),
                          //const SizedBox(height: 5.0),
                          const Text(
                            "VietnamNet",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            //padding: EdgeInsets.only(top: 1),
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                          ),
                          //const SizedBox(height: 10.0),
                          const Text(
                            "VietnamNet",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                          ),
                          //const SizedBox(height: 10.0),
                          const Text(
                            "VietnamNet",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        // body:
      ),
    );
  }

  Text boxChuyenMuc(String name) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 25,
        color: Colors.black,
      ),
    );
  }
}
