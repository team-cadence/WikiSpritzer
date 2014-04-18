import 'dart:html';
import 'dart:convert' show JSON;

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
      if(result == "Not Found") return null; // Six Little Eggs

      //return JSON.deco
      print(result);

      done = true;
      //return JSON.decode(result);
    })
    .catchError((Error error) {
      return null;
    });


  }

}
