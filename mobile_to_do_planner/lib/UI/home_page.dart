import 'package:flutter/material.dart';
import 'package:mobile_to_do_planner/services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: uygulama_cubugu(),
      body: Column(
        children: [
          Text(
            "To Do Planner",
            style: TextStyle(fontSize: 30),
          )
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
        Icon(Icons.person, size: 20),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
