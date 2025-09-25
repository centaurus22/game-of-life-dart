import 'package:dart_console/dart_console.dart';
import 'package:game_of_life_dart/src/tui/lib/src/char.dart';

import 'color.dart';

class Window {
  void printBackground() {
    final console = Console();
    final height = console.windowHeight;
    final width = console.windowWidth;
    final charsPerColor = Color.charsPerColor(height);
    var background = ''; 
    
    for (var row = 0; row < height; row++) {
      var colorBackground = Color.colorBackground(charsPerColor: charsPerColor, position: row);
      background += Char.colorCode(colorBackground) + Char.backGround * width;
    }
    print(background);
  }
}