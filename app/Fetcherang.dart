import 'dart:html';
import 'package:json/json.dart' as KAKE;

class Fetcherang {

  String url = "http://";

  Fetcherang() {

  }

  List<String> fetchArticleAsList(String keyword){
    String url = url;
    XMLHttpRequest request = new XMLHttpRequest();
    request.open("GET", url, async : false);
    request.send();
    var result = request.responseText;

    if(result == "Not Found") return null; // Six Little Eggs

    KAKE.parse(result);

  }

}
