import 'package:do_an_cuoi_ky/SignIn_SignUp_ChangePW/Dang_nhap.dart';
import 'package:do_an_cuoi_ky/Thong_tin_Tai_khoan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaiKhoan(),
    );
  }
}

