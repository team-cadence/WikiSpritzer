import 'dart:html';
import 'dart:convert';
import 'Spritzer.dart';

class Fetcherang {
  bool done = false;
  String url = "http://cadence.singles/wiki/?keyword=";

  Fetcherang() {

  }

   void fetchArticleAsList(String keyword){
    var result;
    done = false;
    HttpRequest.getString(url + keyword)
    .then((String fileContents) {
      print(fileContents);
      result = fileContents;
      if(result == "Not Found") Spritzer.spritzArticle("NO ARTICLE".split(" "));
      //Spritzer.spritzArticle(JSON);
      //return JSON.deco
      Spritzer.spritzArticle(JSON.decode(result));


      done = true;
      //return JSON.decode(result);
    })
    .catchError((Error error) {
      return null;
    });


  }

}
