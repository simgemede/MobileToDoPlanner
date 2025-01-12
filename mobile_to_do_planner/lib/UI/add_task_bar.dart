import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_to_do_planner/UI/input_field.dart';

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
      body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Task",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                GirisAlani(baslik: "Title", ipucu: "Enter your title"),
                GirisAlani(baslik: "Note", ipucu: "Enter your note")
              ],
            ),
          )),
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
