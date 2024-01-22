import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bottom_navigation.dart';
import 'package:flutter_application_1/pages/pages_home.dart';
import 'Lich/lich.dart';
import 'chi_tiet__tien_ich_tt/thoi_tiet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/SignIn_SignUp_ChangePW/Dang_ky.dart';
import 'package:flutter_application_1/SignIn_SignUp_ChangePW/Dang_nhap.dart';
import 'package:flutter_application_1/SignIn_SignUp_ChangePW/Quen_mat_khau.dart';

class Tienich extends StatefulWidget {
  const Tienich({Key? key}) : super(key: key);

  @override
  State<Tienich> createState() => _TienichState();
}

class _TienichState extends State<Tienich> {
  @override
  void initState() {
    super.initState();
    //checkLoginStatus();
  }

  // void checkLoginStatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  //   if (isLoggedIn) {
  //     // User is logged in, navigate to the main screen
  //     Navigator.pushReplacementNamed(context, '/Tienich');
  //   } else {
  //     // User is not logged in, navigate to the login screen
  //     Navigator.pushReplacementNamed(context, '/SignIn');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tiện ích'),
        centerTitle: true,
        backgroundColor: Colors.grey,
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
                          color: Colors.cyan.shade300,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              "assets/thoitiet.png",
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
                              "assets/lich.png",
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
      bottomNavigationBar: Bottom_Navigation(),
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
