import 'package:flutter/material.dart';

class CommentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text('Người dùng 1'),
          subtitle: Text('Nội dung bình luận 1'),
        ),
        ListTile(
          title: Text('Người dùng 2'),
          subtitle: Text('Nội dung bình luận 2'),
        ),
        // Thêm các phần tử khác của danh sách bình luận nếu cần
      ],
    );
  }
}
