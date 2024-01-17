import 'package:do_an_cuoi_ky/SignIn_SignUp_ChangePW/Dang_nhap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? currentUser = _auth.currentUser;
    final TextEditingController email = TextEditingController();
    String password = SignIn.pass;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text("Quên mật khẩu"),
          leading: IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/home');
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(children: [
                  Text("Vui lòng nhập email để nhận link đổi mật khẩu ! "),
                ]),
                const SizedBox(
                  height: 16.0,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Email",
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          backgroundColor: Colors.lightBlue[200]),
                      onPressed: () {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email.text)
                            .then((value) => Navigator.of(context).pop());
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, '/');
                      },
                      child: Text(
                        "Gửi",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}

showalert(BuildContext context, String content, void Function() callback) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Thông báo",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  callback();
                },
                child: const Text('OK')),
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.warning, size: 70),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(content),
              ),
            ],
          ),
        );
      });
}
