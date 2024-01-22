
import './trang/SignIn_SignUp_ChangePW/Dang_nhap.dart';
import 'package:flutter_application_1/Thong_tin_Tai_khoan.dart';
import 'package:flutter_application_1/firebase_options.dart';
import './trang/Tien_Ich.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'trang/trang_chu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App tin tức',
      theme: ThemeData(
      ),
     initialRoute: '/home',
      routes: {
        '/home': (context) =>Trang_Chu() ,
        '/Taikhoan': (context) => TaiKhoan(),
        '/Tienich': (context) => Tienich(),
        '/SignIn': (context) => SignIn(),
      },

    );
  }
}
