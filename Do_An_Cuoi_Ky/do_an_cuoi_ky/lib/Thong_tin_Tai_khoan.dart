import 'package:do_an_cuoi_ky/man_hinh/Tien_Ich.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaiKhoan extends StatefulWidget {
  const TaiKhoan({super.key});

  @override
  State<TaiKhoan> createState() => _TtTk();
}

class _TtTk extends State<TaiKhoan> {
  void _dangxuat() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Thông báo'),
            content: const Text("Bạn có muốn đăng xuất không?"),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Huỷ"),
              ),
              MaterialButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  prefs.setBool('isLoggedIn', false);
                },
                child: const Text("Đồng ý"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var username = FirebaseAuth.instance.currentUser?.displayName;
    var changeUsername = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: const Text("Thông tin tài khoản"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/user.png'),
            radius: 50,
          ),
          MaterialButton(
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        'Đổi tên đăng nhập',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      content:
                          Column(mainAxisSize: MainAxisSize.min, children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
                          child: TextField(
                            controller: changeUsername,
                            decoration: const InputDecoration(
                                label: Text('Tên đăng nhập'),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)))),
                          ),
                        )
                      ]),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No')),
                        TextButton(
                            style: const ButtonStyle(),
                            onPressed: () async {
                              User? user = FirebaseAuth.instance.currentUser;

                              // Kiểm tra xem người dùng có tồn tại không
                              if (user != null) {
                                //   // Cập nhật display name
                                await user
                                    .updateDisplayName(changeUsername.text);
                                print(
                                    'Display Name updated successfully to: ${user.displayName}');
                              } else {
                                print('User is null');
                              }
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: const Text('Yes')),
                      ],
                    );
                  });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(username.toString(),
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold)),
                  Icon(Icons.edit),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Tienich()));
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.grid_view_rounded,
                              size: 25,
                              color: Colors.blueGrey,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Tiện ích",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            )
                          ],
                        )))
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(
                              Icons.access_alarm,
                              size: 25,
                              color: Colors.blueGrey,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Đọc gần đây",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            )
                          ],
                        )))
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: _dangxuat,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          size: 25,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Đăng Xuất",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
