import 'dart:html';
import 'dart:convert';
import 'Spritzer.dart';

class Fetcherang {
  static disambiguation(List<String> list) {
    list.removeAt(0);
    Spritzer.disambiguation(list);
  }

  static final String url = "http://cadence.singles/wiki/?keyword=";

   static void fetchArticleAsList(String keyword){
    var result;
    HttpRequest.getString(url + keyword)
    .then((String fileContents) {
      result = fileContents;
      if(result == "Not Found") Spritzer.spritzArticle("NO ARTICLE".split(" "));
      List<String> list = JSON.decode(result);

      if(list[0] == "disambiguation")
        disambiguation(list);
      else
        Spritzer.spritzArticle(JSON.decode(result));

      //return JSON.decode(result);
    })
    .catchError((Error error) {
      return null;
    });


  }

}
