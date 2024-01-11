import 'package:flutter/material.dart';
import './chan_trang.dart';

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.black,
            width: 200,
            height: 200,
          ),
          Positioned(
              top: 150,
              //right: 150,
              child: Container(
                //height: 500,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  //mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: Image.asset(
                          "assets/img/anh3.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomRight,
                        //height: ,
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          "VOV",
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 0, 30),
                              height: 100,
                              width: 285,
                              child: const Text(
                                "HLV Troussier muốn ĐT Việt Nam qua vòng bảng bằng tạo địa chấn trước Nhật Bản",
                                overflow: TextOverflow.visible,
                                maxLines: null,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              //height: ,
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              width: 60,
                              child: Column(
                                children: const [
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.thumb_up_off_alt_outlined,
                                        color: Colors.white,
                                        size: 30,
                                      )),
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.share,
                                        color: Colors.white,
                                        size: 30,
                                      )),
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(
                                        Icons.more_horiz,
                                        color: Colors.white,
                                        size: 30,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    LinearProgressIndicator(
                      value: 0.2,
                      minHeight: 2,
                      backgroundColor: Colors.black,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan.shade300),
                    ),
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: const Chan_Trang(),
    );
  }
}
