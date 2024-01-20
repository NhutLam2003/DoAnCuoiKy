import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as htmlDom;
import '../models/model_item_list.dart';
class Search extends StatefulWidget {
  const Search({super.key, required this.search});
  final String search;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var newsList = <Map<String, String>>[];
  String tk = '';
  bool check = false;
  void update_tk(String key) {
    setState(() {
      tk = key;
    });
  }

  Future<List<Map<String, String>>> fetchNewsData(String rssUrl) async {
    rssUrl = 'https://vnexpress.net/rss/the-thao.rss';
    var response = await http.get(Uri.parse(rssUrl));

    if (response.statusCode == 200) {
      var rssContent = response.body;
      var document = xml.XmlDocument.parse(rssContent);

      var items = document.findAllElements('item');
      for (var item in items) {
        var title = item.findElements('title').single.firstChild?.text;
        var description =
            item.findElements('description').single.firstChild?.text;
        var imageLink = extractImageLink(description.toString());
        var link = item.findElements('link').single.firstChild?.text;

        if (title.toString().contains(tk) ||
            description.toString().contains(tk)) {
          var newsItem = {
            'title': title.toString(),
            'image': imageLink.toString(),
            'link': link.toString(),
          };
          newsList.add(newsItem);
            if(newsList.isEmpty){
              check = true;
            }
        }
      }
    } else {
      print('Lỗi khi tải về dữ liệu RSS');
    }

    return newsList;
  }

  String extractImageLink(String description) {
    var document = htmlParser.parse(description);
    var imgElement = document.querySelector('img');

    if (imgElement != null) {
      var imageLink = imgElement.attributes['src'];
      return imageLink.toString();
    }

    return '';
  }

  TextEditingController txt_tk = TextEditingController();
  @override
  void initState() {
    super.initState();
    txt_tk = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text("TÌM KIẾM",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Roboto')),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                width: 250,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black26, width: 2.0),
                ),
                child: TextField(
                  controller: txt_tk,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                      hintText: "Nhập tìm kiếm",
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: IconButton(
                    iconSize: 45,
                    onPressed: (){
                      setState(() {
                        newsList.clear();
                      });
                      fetchNewsData(tk).then((value){
                        setState(() {
                          newsList = value;
                        });
                      });
                    },
                    icon: Icon(Icons.search_rounded)),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
          Divider(
            color: Colors.grey.shade300,
            thickness: 4.5,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: false,
              itemCount: newsList.length,
              itemBuilder: (context,index){
                var item = newsList[index];
                var title = item['title'];
                var imgUrl = item['image'];
                var link = item['link'];
                return CustomItem_List(img: imgUrl.toString(),title: title.toString(),link: link.toString(),);
              }
            ),
          )
        ],
      ),
    );
  }
} 
