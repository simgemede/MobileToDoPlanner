import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
      primaryColor: Colors.blue, // Üst renk mavi
      brightness: Brightness.light // Uygulamanın açık tema
      );

  static final dark = ThemeData(
      primaryColor: const Color.fromARGB(255, 44, 44, 44),
      brightness: Brightness.dark);
}
