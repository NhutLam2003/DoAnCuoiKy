import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TaiKhoan extends StatefulWidget {
  const TaiKhoan({super.key});


  @override
  State<TaiKhoan> createState() => _TtTk();
}

class _TtTk extends State<TaiKhoan> {
  String? username = FirebaseAuth.instance.currentUser!.email;
List<String> docIDs=[];
Future getDocID() async{
  await FirebaseFirestore.instance.collection('user').get().then(
    (snapshot) => snapshot.docs.forEach((document) {
      print(document.reference);
      docIDs.add(document.reference.id);
    },));
}
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
                child: Text("Huỷ"),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("Đồng ý"),
              ),
            ],
          );
        });
  }

  var changeUsername = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: Text("Thông tin tài khoản"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: 230,
          height: 230,
          child: Column(
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
                              padding:
                                  const EdgeInsets.fromLTRB(15, 30, 15, 20),
                              child: TextField(
                                controller: changeUsername,
                                decoration: const InputDecoration(
                                    label: Text('Tên đăng nhập'),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)))),
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
                                  User? user =
                                      FirebaseAuth.instance.currentUser;

                                  // Kiểm tra xem người dùng có tồn tại không
                                  if (user != null) {
                                    //   // Cập nhật display name
                                    await user?.updateDisplayName(
                                        changeUsername.text);
                                    //   // final DatabaseReference
                                    //   //     databaseReference = FirebaseDatabase
                                    //   //         .instance
                                    //   //         .ref()
                                    //   //         .child('/users');

                                    //   // databaseReference
                                    //   //
                                    //   //     .update({
                                    //   //   user.displayName!: changeUsername.text
                                    //   // });
                                    //   // In thông báo sau khi cập nhật thành công
                                    print(
                                        'Display Name updated successfully to: ${user.displayName}');
                                  } else {
                                    print('User is null');
                                  }
                                  Navigator.popAndPushNamed(context, '/home');
                                  setState(() {
                                    username = changeUsername.text;
                                  });
                                },
                                child: const Text('Yes')),
                          ],
                        );
                      });
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(username!,
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                      Icon(Icons.edit),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushNamed(context, '/change-password');
          },
          child: Container(
              child: Row(
            children: [
              Icon(
                Icons.edit,
                size: 25,
                color: Colors.blueGrey,
              ),
              Text(" Thay đổi mật khẩu",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  )),
            ],
          )),
        ),
        Container(
          height: 100,
          child: Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {},
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
        Container(
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
        Container(
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
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('username', username));
  }
}
