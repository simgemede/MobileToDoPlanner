import 'package:flutter/material.dart';
import 'package:mobile_to_do_planner/UI/home_page.dart';

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
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(33, 150, 243, 1), // Üst renk mavi
          brightness: Brightness.light // Uygulamanın açık tema
          ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          primaryColor: const Color.fromARGB(255, 44, 44, 44),
          brightness: Brightness.dark),
      home: HomePage(),
    );
  }
}
