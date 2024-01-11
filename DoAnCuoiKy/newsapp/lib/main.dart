import 'package:newsapp/man_hinh/Chi_Tiet.dart';
import 'package:newsapp/man_hinh/Tien_Ich.dart';
import 'package:newsapp/man_hinh/chi_tiet__tien_ich_tt/thoi_tiet.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/man_hinh/chi_tiet__tien_ich_tt/tt_model.dart';

void main() {
  runApp(const MyApp()
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App tin tức',
      home:Tienich()
    );
  }
}


