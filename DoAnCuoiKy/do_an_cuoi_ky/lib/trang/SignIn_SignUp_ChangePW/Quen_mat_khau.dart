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
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? currentUser = auth.currentUser;
    final TextEditingController email = TextEditingController();
    // String password = SignIn.pass;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text("Quên mật khẩu"),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/SignIn');
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                            "Vui lòng nhập email để nhận link đổi mật khẩu !")),
                  ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          backgroundColor: Colors.lightBlue[200]),
                      onPressed: () {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email.text)
                            .then((value) => Navigator.of(context).pop());
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, '/SignIn');
                      },
                      child: const Text(
                        "Gửi",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

// showalert(BuildContext context, String content, void Function() callback) {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(
//             "Thông báo",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           actions: [
//             TextButton(
//                 onPressed: () {
//                   callback();
//                 },
//                 child: const Text('OK')),
//           ],
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(Icons.warning, size: 70),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: Text(content),
//               ),
//             ],
//           ),
//         );
//       });
// }
