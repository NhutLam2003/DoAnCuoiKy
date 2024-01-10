import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Tin_Bong_Da extends StatefulWidget {
  const Tin_Bong_Da({super.key});

  @override
  State<Tin_Bong_Da> createState() => _Tin_Bong_DaState();
}

class _Tin_Bong_DaState extends State<Tin_Bong_Da> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Bóng đá đây"),
    );
  }
}