import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_to_do_planner/screens/home_page.dart';
import 'package:mobile_to_do_planner/UI/theme.dart';
import 'package:mobile_to_do_planner/db/db_helper.dart';
import 'package:mobile_to_do_planner/screens/baslangic_ekrani.dart';
import 'package:mobile_to_do_planner/screens/giris_ekrani.dart';
import 'package:mobile_to_do_planner/screens/kayit_ekrani.dart';
import 'package:mobile_to_do_planner/services/theme_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBYardimci.initDb();
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
      home: const BaslangicEkrani(),
      routes: {
        '/GirisEkrani': (context) => const GirisEkrani(),
        '/kayitEkrani': (context) => const KayitEkrani(),
      },
    );
  }
}
