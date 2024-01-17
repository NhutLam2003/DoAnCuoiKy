import 'package:do_an_cuoi_ky/SignIn_SignUp_ChangePW/Dang_ky.dart';
import 'package:do_an_cuoi_ky/SignIn_SignUp_ChangePW/Dang_nhap.dart';
import 'package:do_an_cuoi_ky/SignIn_SignUp_ChangePW/Quen_mat_khau.dart';
import 'package:do_an_cuoi_ky/Thong_tin_Tai_khoan.dart';
import 'package:do_an_cuoi_ky/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App tin tức',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignIn(),
    );
  }
}
