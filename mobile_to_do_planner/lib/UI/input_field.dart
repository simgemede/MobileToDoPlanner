import 'package:flutter/material.dart';

class GirisAlani extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const GirisAlani(
      {super.key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0)),
          )
        ],
      ),
    );
  }
}
