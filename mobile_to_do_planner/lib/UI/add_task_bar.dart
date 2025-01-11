import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_to_do_planner/services/theme_services.dart';

class GorevBariSayfasi extends StatefulWidget {
  const GorevBariSayfasi({super.key});

  @override
  State<GorevBariSayfasi> createState() => _GorevBariSayfasiState();
}

class _GorevBariSayfasiState extends State<GorevBariSayfasi> {
  String? _profilFotoUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: uygulama_cubugu(),
      body: Container(),
    );
  }

  AppBar uygulama_cubugu() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(Icons.arrow_back_sharp, size: 20),
      ),
      actions: [
        GestureDetector(
          onTap: () async {},
          child: CircleAvatar(
            backgroundImage: _profilFotoUrl != null
                ? FileImage(File(_profilFotoUrl!))
                : const AssetImage("images/foto.jpg"),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
