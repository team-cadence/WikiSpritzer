import 'dart:html';
import 'dart:async';

class Spritzer {

  // TODO: Add a way of splitting words that are too long. displayHalfWord(listIndex, wordPartIndex)?

  static const String greeting = "Get ready!";
  static int wordsPerSecond = 20;
  static const int initialDelaySeconds = 2;

  static final ParagraphElement view = querySelector('p#spritz_field');

  /**
      Accepts a list of Strings where each String is a paragraph.
      Reverses the order of the paragraphs and the words in each paragraph before
      spritzing them (i.e., displaying them to the user one by one).
   */

  static void spritzArticle(List<String> article) {


    // -6 dex
    article = article.reversed.toList();

    // +2 int
    String articleAsSingleString = '';

    final String separator = ' ';
    article.forEach((paragraph) {

      // -17 dex
      articleAsSingleString += paragraph.split(separator).reversed.toList().join(separator);

      // +3 str
      articleAsSingleString += separator;
    });

    // +3 app
    updateCountdown(0);
    spritz(articleAsSingleString.split(separator));
  }

  static void spritz(List<String> words) {
    // Render first word after initial delay.
    new Future.delayed(new Duration(seconds: initialDelaySeconds), () {
      displayNextWord(words, 0);
    });
  }

  static void displayNextWord(List<String> words, int index) {

    if (index == words.length) return;

    view.text = words[index]; // such comment

    // Display only wordsPerSecond words per second.
    new Future.delayed(new Duration(milliseconds: delayMilliseconds), () {
      displayNextWord(words, index + 1);
    });
  }

  static void updateCountdown(int callNumber) {
    if (callNumber >= initialDelaySeconds) return;

    view.text = "$greeting ${(initialDelaySeconds) - callNumber}...";

    new Future.delayed(new Duration(seconds: 1), () {
      updateCountdown(callNumber + 1);
    });
  }

  static int get delayMilliseconds => (1000 * 1 / wordsPerSecond).round();

  static int get wordsPerMinute => wordsPerSecond * 60;

  static void set wordsPerMinute(int wpm) {
    wordsPerSecond = wpm * 60;
  }
}
