import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as htmlDom;
import '../mau/mau_pt_danh_sach.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Trang_Tim_Kiem extends StatefulWidget {
  const Trang_Tim_Kiem({
    super.key,
  });
  @override
  State<Trang_Tim_Kiem> createState() => _Trang_Tim_KiemState();
}

class _Trang_Tim_KiemState extends State<Trang_Tim_Kiem> {
  var AllnewsList = <Map<String, String>>[]; // Danh sách tin tức gốc
  var tk_newsList =
      <Map<String, String>>[]; // Danh sách chứa kết quả tin tức tìm kiếm +
  List<String> tk_list = []; // Danh sách các từ khóa tìm kiếm
  TextEditingController txt_tk = TextEditingController();
  //// Load các từ khóa
  Future<void> loadSavedKeywords() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedKeywords = prefs.getStringList('key');
    if (savedKeywords != null) {
      setState(() {
        tk_list = savedKeywords;
      });
    }
  }

  ///// lưu các từ khóa
  Future<void> saveKeywords() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('key', tk_list);
  }

  //// Chọn từ khóa quay lại ô text
  void backKey(String key) {
    setState(() {
      txt_tk.text = key;
      filterNewsList();
    });
  }

  //// xóa từ khóa
  void removeKey(int index) {
    setState(() {
      tk_list.removeAt(index);
      saveKeywords();
    });
  }

  ///// Lấy dữ liệu tin tức từ rss
  Future<List<Map<String, String>>> fetchNewsData(String rssUrl) async {
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

        var newsItem = {
          'title': title.toString(),
          'image': imageLink.toString(),
          'link': link.toString(),
        };
        AllnewsList.add(newsItem);
      }
    } else {
      print('Lỗi khi tải về dữ liệu RSS');
    }

    return AllnewsList;
  }

  //// lấy đường dẫn hình ảnh chứa trong description
  String extractImageLink(String description) {
    var document = htmlParser.parse(description);
    var imgElement = document.querySelector('img');

    if (imgElement != null) {
      var imageLink = imgElement.attributes['src'];
      return imageLink.toString();
    }

    return '';
  }

  /// Tải dữ liệu tin tức
  Future<void> loadNewsData() async {
    var newsDataList = await Future.wait([
      fetchNewsData('https://vnexpress.net/rss/the-thao.rss'),
      fetchNewsData('https://vnexpress.net/rss/giao-duc.rss'),
      fetchNewsData('https://vnexpress.net/rss/suc-khoe.rss'),
    ]);
    setState(() {
      AllnewsList = newsDataList.expand((list) => list).toList();
    });
  }

  //////
  @override
  void initState() {
    super.initState();
    txt_tk = TextEditingController();
    loadNewsData();
    loadSavedKeywords();
  }

  //////
  void filterNewsList() {
    final key = txt_tk.text.trim();
    if (key.isNotEmpty && key.split(' ').length == 1) {
      setState(() {
        if (!tk_list.contains(key)) {
          tk_list.add(key);
          saveKeywords();
        }

        if (AllnewsList.isNotEmpty) {
          tk_newsList = AllnewsList.where((item) =>
              (item['title'] != null && item['title']!.contains(key)) ||
              (item['description'] != null &&
                  item['description']!.contains(key))).toList();
        } else {
          tk_newsList = [];
        }
      });
    }
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
                width: 350,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black26, width: 2.0),
                ),
                child: TextField(
                  
                  controller: txt_tk,
                  onChanged: (value) {
                    filterNewsList();
                  },
                  decoration: InputDecoration(
                      //prefix: Icon(Icons.search_rounded,color: Colors.black45,),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 13),
                      hintText: "Nhập tìm kiếm",
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                          onPressed: () {
                            txt_tk.clear();
                          },
                          icon: Icon(
                            Icons.clear_outlined,
                            color: Colors.black45,
                          ))),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 10),
              //   child: IconButton(
              //       iconSize: 45,
              //       onPressed: filterNewsList,
              //       icon: Icon(Icons.search_rounded)),
              // ),
            ],
          ),
          const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
          Divider(
            color: Colors.grey.shade300,
            thickness: 4.5,
          ),

          ///
          if (txt_tk.text.isEmpty) ...[
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Text("Lịch sử tìm kiếm",style: TextStyle(fontSize: 15),),),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: tk_list.length,
                  itemBuilder: (context, index) {
                    final key = tk_list[index];
                    return ListTile(
                      leading: Icon(Icons.history),
                      title: GestureDetector(
                        onTap: () {
                          backKey(key);
                        },
                        child: Row(
                          children: [
                            Text(key),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                removeKey(index);
                              },
                              child: Icon(Icons.clear),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: tk_newsList.length,
                itemBuilder: (context, index) {
                  var item = tk_newsList[index];
                  var title = item['title'];
                  var imgUrl = item['image'];
                  var link = item['link'];
                  var date = item['date'];
                  return CustomItem_List(
                    img: imgUrl.toString(),
                    title: title.toString(),
                    link: link.toString(),
                    date: date.toString(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
