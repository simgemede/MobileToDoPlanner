import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  autofocus: false,
                  controller: controller,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    hintText: "Enter your title",
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
