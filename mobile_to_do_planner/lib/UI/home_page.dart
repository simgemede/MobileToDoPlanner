import 'package:flutter/material.dart';
import 'package:mobile_to_do_planner/services/theme_services.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
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
        CircleAvatar(
          backgroundImage:
              AssetImage("images/british-shorthair-3401683_640.jpg"),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
