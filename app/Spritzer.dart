import 'dart:html';
import 'dart:async';

class Spritzer {

  // TODO: Add a way of splitting words.

  static const int wordsPerSecond = 2;
  static final DivElement view = querySelector('div#spritz_text_field');

  static void displayNextWord(List words, int index) {

    if (index == words.length) return;

    new Future.delayed(const Duration(milliseconds: 1000 * 1/wordsPerSecond), () {
      view.text = words[index];
      displayNextWord(words, index + 1);
    });
  }


  static void spritzParagraph(String paragraph) {
    List<String> words = paragraph.split(" ");

    displayNextWord(words, 0);
  }
}
