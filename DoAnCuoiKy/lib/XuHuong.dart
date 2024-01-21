import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class XuHuong extends StatefulWidget {
  const XuHuong({super.key});

  @override
  State<XuHuong> createState() => _XuHuongState();
}

class _XuHuongState extends State<XuHuong> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Xu hướng',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[300],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(
              50,
              (index) => ListTile(
                title: Text('data ${index + 1}'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
