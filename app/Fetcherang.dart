import 'dart:html';
import 'dart:convert';
import 'Spritzer.dart';

class Fetcherang {
  static final String url = "http://cadence.singles/wiki/?keyword=";

   static void fetchArticleAsList(String keyword){
    var result;
    HttpRequest.getString(url + keyword)
    .then((String fileContents) {
      result = fileContents;
      if(result == "Not Found") Spritzer.spritzArticle("NO ARTICLE".split(" "));
      //Spritzer.spritzArticle(JSON);
      //return JSON.deco
      Spritzer.spritzArticle(JSON.decode(result));

      //return JSON.decode(result);
    })
    .catchError((Error error) {
      return null;
    });


  }

}
