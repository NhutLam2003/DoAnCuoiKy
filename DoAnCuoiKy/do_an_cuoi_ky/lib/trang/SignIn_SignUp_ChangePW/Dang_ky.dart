import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final form_key = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String txt = "";
  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Lỗi đăng ký $e");
    }
  }

  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('user');
  Future<void> createOrder(User user) async {
    try {
      Map<String, dynamic> UserMap = {
        'email': user.email,
        'username': user.displayName,
      };
      await FirebaseFirestore.instance.collection('orders').add(UserMap);
      print('User tạo thành công!');
      Navigator.pop(context);
    } catch (e) {
      print('Lỗi khi tạo User: $e');
    }
  }

  bool obs = true;
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/logo.jpg',
                          ),
                          radius: 20,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 80, left: 20),
                    child: const Text(
                      "ĐĂNG KÝ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      controller: username,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        labelText: 'Tên đăng nhập',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Hãy nhập mật khẩu';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        labelText: 'Email',
                        hintText: 'Nhập email',
                      ),
                      validator: (value) {
                        if (value == "") {
                          return "email không được trống";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      controller: password,
                      obscureText: obs,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15.0),
                          labelText: 'Mật khẩu',
                          suffixIcon: IconButton(
                            icon: obs
                                ? const Icon(Icons.visibility_off_rounded)
                                : const Icon(Icons.remove_red_eye),
                            onPressed: () {
                              setState(() {
                                obs = !obs;
                              });
                            },
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Hãy nhập mật khẩu';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      controller: confirmPassword,
                      obscureText: obs,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15.0),
                          labelText: 'Nhập lại mật khẩu',
                          suffixIcon: IconButton(
                            icon: obs
                                ? const Icon(Icons.visibility_off_rounded)
                                : const Icon(Icons.remove_red_eye),
                            onPressed: () {
                              setState(() {
                                obs = !obs;
                              });
                            },
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập lại mật khẩu';
                        } else if (value != password.text) {
                          return 'Mật khẩu không đúng';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        txt,
                        style: const TextStyle(color: Colors.red, fontSize: 15),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    onPressed: () {
                      if (password.text == confirmPassword.text) {
                        if (password.text.length >= 6) {
                          registerWithEmailAndPassword(
                                  email.text, password.text)
                              .then((value) {
                            FirebaseAuth.instance.currentUser
                                ?.updateDisplayName(username.text);
                            DatabaseReference ref =
                                FirebaseDatabase.instance.ref();
                            ref.child("users").update({username.text: ""});
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });

                          Navigator.pop(context);
                        } else {
                          _showSnackBar("Mất khẩu phải 6 kí tự trở lên");
                        }
                      } else {
                        _showSnackBar("Mất khẩu không khớp");
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: 0.3,
                              blurRadius: 6,
                            )
                          ]),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 15,
                      child: const Center(
                        child: Text(
                          "ĐĂNG KÝ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Đã có tài khoản?",
                          style: TextStyle(fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                            Navigator.pushNamed(context, '/SignIn');
                          },
                          child: const Text(
                            "Đăng nhập",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
