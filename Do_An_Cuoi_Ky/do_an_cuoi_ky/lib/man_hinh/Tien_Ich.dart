import 'package:flutter/material.dart';
import 'package:do_an_cuoi_ky/man_hinh/Lich/lich.dart';
import 'package:do_an_cuoi_ky/man_hinh/chi_tiet__tien_ich_tt/thoi_tiet.dart';
import 'chan_trang.dart';

class Tienich extends StatelessWidget {
  const Tienich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tiện ích'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            // Hàm được gọi khi nút back được nhấn
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        'Danh mục tiện ích',
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Chuyển trang khi container hình ảnh được nhấn
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CT_ThoiTiet(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2 - 16.0,
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            child: Image.asset(
                              "assets/img/thoitiet.png",
                              height: 200,
                              width: 240,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Chuyển trang khi container hình ảnh được nhấn
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Lich(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 2 - 16.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            child: Image.asset(
                              "assets/img/lich.png",
                              height: 200,
                              width: 240,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Chan_Trang(),
    );
  }
}

class YourNextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang Tiếp Theo'),
      ),
      body: Center(
        child: Text('Đây là trang tiếp theo'),
      ),
    );
  }
}
