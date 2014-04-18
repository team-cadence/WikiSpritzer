
import 'dart:html';
import 'Fetcherang.dart';

import 'package:chrome/chrome_app.dart' as chrome;

import 'Spritzer.dart';

int boundsChange = 100;

/**
 * For non-trivial uses of the Chrome Apps API, please see the
 * [chrome](http://pub.dartlang.org/packages/chrome).
 * 
 * * http://developer.chrome.com/apps/api_index.html
 */
void main() {

  // +3 luk
  String paragraph = "Hello, world.|What is this place?";
  List<String> article = paragraph.split('|');

  Spritzer.spritzArticle(article);

}

void resizeWindow(MouseEvent event) {
  chrome.Bounds bounds = chrome.app.window.current().getBounds();

  bounds.width += boundsChange;
  bounds.left -= boundsChange ~/ 2;

  chrome.app.window.current().setBounds(bounds);

  boundsChange *= -1;
}
