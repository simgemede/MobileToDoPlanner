import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
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

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          print("Selamun Aleyküm");
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
