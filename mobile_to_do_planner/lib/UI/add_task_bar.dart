import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_to_do_planner/UI/input_field.dart';

class GorevBariSayfasi extends StatefulWidget {
  const GorevBariSayfasi({super.key});

  @override
  State<GorevBariSayfasi> createState() => _GorevBariSayfasiState();
}

class _GorevBariSayfasiState extends State<GorevBariSayfasi> {
  DateTime _seciliGun = DateTime.now();
  String _bitisZamani = " ";
  String _baslangicZamani =
      DateFormat("hh:mm a").format(DateTime.now()).toString();
  String? _profilFotoUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: uygulama_cubugu(),
      body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Task",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                GirisAlani(baslik: "Title", ipucu: "Enter your title"),
                GirisAlani(baslik: "Note", ipucu: "Enter your note"),
                GirisAlani(
                  baslik: "Date",
                  ipucu: DateFormat.yMd().format(_seciliGun),
                  widget: IconButton(
                    icon: Icon(Icons.calendar_today_outlined),
                    onPressed: () {
                      print("Merhaba");
                      _tarihAl();
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: GirisAlani(
                      baslik: "Start Date",
                      ipucu: _baslangicZamani,
                      widget: IconButton(
                        icon: Icon(
                          Icons.access_time_rounded,
                        ),
                        onPressed: () {},
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: GirisAlani(
                      baslik: "End Date",
                      ipucu: _bitisZamani,
                      widget: IconButton(
                        icon: Icon(
                          Icons.access_time_rounded,
                        ),
                        onPressed: () {},
                      ),
                    ))
                  ],
                )
              ],
            ),
          )),
    );
  }

  AppBar uygulama_cubugu() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(Icons.arrow_back_sharp, size: 20),
      ),
      actions: [
        GestureDetector(
          onTap: () async {},
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

  Future<void> _tarihAl() async {
    DateTime? _secimTarihi = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );
    if (_secimTarihi != null) {
      setState(() {
        _seciliGun = _secimTarihi;
      });
    } else {
      print("Something is wrong!");
    }
  }

  /*Future<void> _zamanAl() async {
    var secilenZaman = _secilenZamaniGoster();
    String _zamanBicimlendirme = secilenZaman.format(context);
    if (secilenZaman == null) {
      print("Time canceled");
    } else if (baslangicZamaniMi == true) {
      _baslangicZamani = _zamanBicimlendirme;
    } else if (baslangicZmaniMi == false) {
      _bitisZamani = _zamanBicimlendirme;
    }
  }*/

  _secilenZamaniGoster() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(hour: 10, minute: 10));
  }
}
