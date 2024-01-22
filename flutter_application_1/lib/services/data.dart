import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as htmlDom;

class NewsDataFetcher {
  Future<List<Map<String, String>>> fetchNewsData(String rssUrl) async {
    var response = await http.get(Uri.parse(rssUrl));
    var newsList = <Map<String, String>>[];

    if (response.statusCode == 200) {
      var rssContent = response.body;
      var document = xml.XmlDocument.parse(rssContent);

      var items = document.findAllElements('item');
      for (var item in items) {
        var title = item.findElements('title').single.firstChild?.text;
        var description = item.findElements('description').single.firstChild?.text;
        var imageLink = extractImageLink(description.toString());
        var link = item.findElements('link').single.firstChild?.text;
        var newsItem = {
          'title': title.toString(),
          'image': imageLink.toString(),
          'link': link.toString(),
        };

        newsList.add(newsItem);
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
}