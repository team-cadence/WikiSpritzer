import 'dart:html';
import 'dart:async';

class Spritzer {

  // TODO: Add a way of splitting words that are too long. displayHalfWord(listIndex, wordPartIndex)?

  static const String greeting = "Get ready!";
  static const int wordsPerSecond = 8;
  static const int initialDelaySeconds = 3;

  static final DivElement view = querySelector('p#spritz_field');

  static void displayNextWord(List<String> words, int index) {

    if (index == words.length) return;

    view.text = words[index];

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

  static void spritz(List<String> words) {
    // Render first word after initial delay.
    new Future.delayed(new Duration(seconds: initialDelaySeconds), () {
      displayNextWord(words, 0);
    });

    updateCountdown(0);
  }

  static int get delayMilliseconds => (1000 * 1 / wordsPerSecond).round();

  static int get wordsPerMinute => wordsPerSecond * 60;
}
