import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_to_do_planner/UI/home_page.dart';
import 'package:mobile_to_do_planner/UI/theme.dart';
import 'package:mobile_to_do_planner/services/theme_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.aydinlik,
      darkTheme: Themes.karanlik,
      themeMode: TemaServisi().temaModu,
      home: HomePage(),
    );
  }
}
