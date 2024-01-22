import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChiTietPage extends StatelessWidget {
  final String url;

  ChiTietPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Chi tiết bảng tin'),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted, // Cho phép thực thi JavaScript
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow, // Tự động phát video
        onPageFinished: (String url) {
          // Xử lý khi trang đã tải xong
        },
        onWebResourceError: (WebResourceError error) {
          // Xử lý lỗi khi tải trang
        },
        gestureNavigationEnabled: true, // Cho phép điều hướng bằng cử chỉ
      ),
    );
  }
}
