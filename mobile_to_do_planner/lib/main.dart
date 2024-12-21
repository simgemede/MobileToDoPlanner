import 'package:flutter/material.dart';
import 'package:mobile_to_do_planner/UI/home_page.dart';
import 'package:mobile_to_do_planner/UI/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}