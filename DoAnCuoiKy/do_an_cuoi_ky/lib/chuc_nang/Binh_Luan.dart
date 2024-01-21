
import 'package:flutter/material.dart';

class BinhLuan extends StatefulWidget {
  const BinhLuan({super.key});

  @override
  State<BinhLuan> createState() => _BinhLuanState();
}

class _BinhLuanState extends State<BinhLuan> {
  TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'Viết bình luận...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Xử lý khi nút gửi bình luận được nhấn
              if (_commentController.text.isNotEmpty) {
                // Thực hiện xử lý bình luận, ví dụ: thêm vào danh sách bình luận
                // Dùng setState để cập nhật giao diện nếu cần
                _addComment(_commentController.text);
                _commentController.clear(); // Xóa nội dung sau khi gửi
              }
            },
          ),
        ],
      ),
    );
  }
  void _addComment(String comment) {
    // Thực hiện xử lý để thêm bình luận vào danh sách hoặc lưu trữ
    // (ví dụ: sử dụng một danh sách, cơ sở dữ liệu, ...)

    // Ví dụ đơn giản: thêm vào danh sách tạm thời
    CommentListState.comments.add(comment);
    setState(() {}); // Cập nhật giao diện
  }
}
class CommentListState {
  static List<String> comments = [];
}