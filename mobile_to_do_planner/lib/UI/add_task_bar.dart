import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_to_do_planner/services/theme_services.dart';

class GorevBariSayfasi extends StatelessWidget {
  const GorevBariSayfasi({super.key});

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
          onTap: () async {},
          child: CircleAvatar(
            backgroundImage: _profilFotoUrl != null
                ? FileImage(File(_profilFotoUrl! as String))
                : const AssetImage("images/foto.jpg"),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class _profilFotoUrl {}
