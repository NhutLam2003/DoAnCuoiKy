import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../trang/chi_tiet.dart';
// Custom item danh sách tin phía dưới
class CustomItem_List extends StatefulWidget {
  const CustomItem_List({super.key, required this.img, required this.title,required this.link,required this.date});
  final String img;
  final String title;
  final String link;
  final String date;
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
  final defaultIcon = Icon(Icons.photo_size_select_actual,color: Colors.black87,);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                  child: (widget.img != null && widget.img.isNotEmpty)?
                  Image.network(
                    widget.img
                  ):defaultIcon,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
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
                        SizedBox(height: 10,),
                        Text(widget.date)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
      onTap: () async{
        Uri url = Uri.parse(widget.link);
        if(await canLaunchUrl(url)){
          await launchUrl(url);
        }else {
          // Nếu không mở được URL, chuyển sang trang chi tiết
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChiTietPage(url: widget.link),
            ),
          );
        }
      },
    );
  }
}