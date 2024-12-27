import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';

class TemaServisi {
  final _temaKutusu =
      GetStorage(); // İcinde saklamak icin getstorage örnegi olusturdum.
  final _anahtar = 'karanlikMod'; // Depolamada kullanilacak anahtar

  bool _temaKutusundanAl() => _temaKutusu.read(_anahtar) ?? false;
  ThemeMode get temaModu => _temaKutusundanAl()
      ? ThemeMode.dark
      : ThemeMode.light; // true ise dark döner
  void temaDegistir() {
    Get.changeThemeMode(_temaKutusundanAl() ? ThemeMode.light : ThemeMode.dark);
  }
}
