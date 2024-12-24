import 'package:flutter/material.dart';

class Themes {
  static final gunduz = ThemeData(
      primaryColor: Colors.blue, // Üst renk mavi
      brightness: Brightness.light // Uygulamanın açık tema
      );

  static final gece = ThemeData(
      primaryColor: const Color.fromARGB(255, 44, 44, 44),
      brightness: Brightness.dark);
}
