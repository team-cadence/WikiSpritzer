import 'dart:html';
import 'Fetcherang.dart';
import 'Spritzer.dart';
import 'dart:async';

import 'package:chrome/chrome_app.dart' as chrome;

final InputElement searchButton = querySelector('input#search_button');
final InputElement keywordTextField = querySelector('input#keyword_input');

final InputElement wordsPerSecondRange = querySelector('#words_per_second_range');
final LabelElement wordsPerSecondRangeLabel = querySelector('#words_per_second_label');
final String wordsPerSecondRangeLabelBase = wordsPerSecondRangeLabel.text;

int boundsChange = 100;

/**
 * For non-trivial uses of the Chrome Apps API, please see the
 * [chrome](http://pub.dartlang.org/packages/chrome).
 *
 * * http://developer.chrome.com/apps/api_index.html
 */

void main() {

  // +3 luk
  Spritzer.restart("banana");

  searchButton.onClick.listen(handleButtonClick);
  wordsPerSecondRange.onChange.listen(handleWpsChange);

  wordsPerSecondRange.value = "${Spritzer.wordsPerSecond}";
  wordsPerSecondRangeLabel.text = "$wordsPerSecondRangeLabelBase ${Spritzer.wordsPerSecond}";

}

void handleWpsChange(Event e) {
  int newWps = int.parse((e.target as InputElement).value);

  Spritzer.wordsPerSecond = newWps;

  wordsPerSecondRangeLabel.text = "$wordsPerSecondRangeLabelBase $newWps";
}

void handleButtonClick(MouseEvent e) {

  String keyword = keywordTextField.value;

  Spritzer.restart(keyword);
}

void resizeWindow(MouseEvent event) {
  chrome.Bounds bounds = chrome.app.window.current().getBounds();

  bounds.width += boundsChange;
  bounds.left -= boundsChange ~/ 2;

  chrome.app.window.current().setBounds(bounds);

  boundsChange *= -1;
}
