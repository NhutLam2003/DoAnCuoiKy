import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Text("Video"),
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back))
        ],
      )
    );
  }
}