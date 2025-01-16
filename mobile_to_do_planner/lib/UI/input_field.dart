import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GirisAlani extends StatelessWidget {
  final String baslik;
  final String ipucu;
  final TextEditingController? kontrol;
  final Widget? widget;
  const GirisAlani(
      {super.key,
      required this.baslik,
      required this.ipucu,
      this.kontrol,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            baslik,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  controller: kontrol,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    hintText: ipucu,
                  ),
                )),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
