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
      appBar: uygulama_cubugu(),
      body: Container(),
    );
  }

  AppBar uygulama_cubugu() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          TemaServisi().temaDegistir();
        },
        child: const Icon(Icons.nightlight_round, size: 20),
      ),
      actions: [
        GestureDetector(
          onTap: () async {
            /*setState(() {
              _profilFotoUrl = "/path/to/new/image.jpg";
            });*/
          },
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
