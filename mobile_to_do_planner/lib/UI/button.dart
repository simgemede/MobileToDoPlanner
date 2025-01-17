import 'package:flutter/material.dart';

class Butonum extends StatelessWidget {
  final String label;
  final Function() onTap;
  const Butonum({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.blue),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
