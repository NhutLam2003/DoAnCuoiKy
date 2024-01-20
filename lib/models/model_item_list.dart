import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Custom item danh sách tin phía dưới
class CustomItem_List extends StatefulWidget {
  const CustomItem_List({super.key, required this.img, required this.title,required this.link});
  final String img;
  final String title;
  final String link;
  @override
  State<CustomItem_List> createState() => _CustomItem_ListState();
}

class _CustomItem_ListState extends State<CustomItem_List> {
  // void _openNewsUrl() async { 
  //   // ignore: deprecated_member_use
  //   if (await canLaunch(widget.link)) {
  //     // ignore: deprecated_member_use
  //     await launch(widget.link);
  //   } else {
  //     // Xử lý khi không thể mở URL
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        Uri url = Uri.parse(widget.link);
        if(await canLaunchUrl(url)){
          await launchUrl(url);
        }
      },
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.grey.shade200,
          elevation: 5,
          child: Container(
            margin: const EdgeInsets.all(20),
            color: Colors.grey.shade200,
            child: Row(
              //mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///// Chứa tấm ảnh
                Container(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      widget.img,
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 16),
                        overflow: TextOverflow.visible,
                        maxLines: null, // cho phép xuống hàng khi tràn dòng
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: const Text("VOV . 2 giờ"),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}