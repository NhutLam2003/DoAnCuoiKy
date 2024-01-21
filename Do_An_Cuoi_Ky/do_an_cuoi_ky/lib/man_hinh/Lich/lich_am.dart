import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;


class AmlichPage extends StatefulWidget {
  @override
  _AmlichPageState createState() => _AmlichPageState();
}

class _AmlichPageState extends State<AmlichPage> {
  String htmlContent = '';

  @override
  void initState() {
    super.initState();
    fetchHtmlContent();
  }

  Future<void> fetchHtmlContent() async {
    final response = await http.get(Uri.parse('https://www.informatik.uni-leipzig.de/~duc/amlich/'));
    if (response.statusCode == 200) {
      setState(() {
        htmlContent = response.body;
      });
    } else {
      setState(() {
        htmlContent = 'Error fetching HTML content';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Âm lịch VN'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Html(data: htmlContent),
          ),
        ],
      ),
    );
  }
}