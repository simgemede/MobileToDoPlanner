import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobile_to_do_planner/services/theme_services.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  String? _profilFotoUrl;

  void _fotoDegistir(String? yeniFoto) {
    setState(() {
      _profilFotoUrl = yeniFoto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: uygulama_cubugu(),
      body: Column(
        children: [
          Text(
            "To Do Planner",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }

  uygulama_cubugu() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          TemaServisi().temaDegistir();
        },
        child: Icon(Icons.nightlight_round, size: 20),
      ),
      actions: [
        GestureDetector(
          onTap: () async {},
          child: CircleAvatar(
            backgroundImage: _profilFotoUrl != null
                ? FileImage(File(_profilFotoUrl!))
                : AssetImage("images/foto.jpg") as ImageProvider,
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
