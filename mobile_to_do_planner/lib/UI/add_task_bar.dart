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
                const Text(
                  "Add Task",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                const GirisAlani(baslik: "Title", ipucu: "Enter your title"),
                const GirisAlani(baslik: "Note", ipucu: "Enter your note"),
                GirisAlani(
                  baslik: "Date",
                  ipucu: DateFormat.yMd().format(_seciliGun),
                  widget: IconButton(
                    icon: const Icon(Icons.calendar_today_outlined),
                    onPressed: () {
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
                        icon: const Icon(
                          Icons.access_time_rounded,
                        ),
                        onPressed: () {
                          _zamanAl(baslangicZamaniMi: true);
                        },
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: GirisAlani(
                      baslik: "End Date",
                      ipucu: _bitisZamani,
                      widget: IconButton(
                        icon: const Icon(
                          Icons.access_time_rounded,
                        ),
                        onPressed: () {
                          _zamanAl(baslangicZamaniMi: false);
                        },
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
                : const AssetImage("images/foto.jpg") as ImageProvider,
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  Future<void> _tarihAl({bool? baslangicZamaniMi}) async {
    DateTime? _secimTarihi = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );

    if (_secimTarihi != null) {
      setState(() {
        _seciliGun = _secimTarihi;
        if (baslangicZamaniMi == true) {
          _baslangicZamani = DateFormat.yMd().format(_seciliGun);
        } else if (baslangicZamaniMi == false) {
          _bitisZamani = DateFormat.yMd().format(_seciliGun);
        }
      });
    } else {
      print("Date selection canceled!");
    }
  }

  Future<void> _zamanAl({required bool baslangicZamaniMi}) async {
    var secilenZaman = await _secilenZamaniGoster();
    if (secilenZaman != null) {
      String _zamanBicimlendirme = secilenZaman.format(context);
      setState(() {
        if (baslangicZamaniMi) {
          _baslangicZamani = _zamanBicimlendirme;
        } else {
          _bitisZamani = _zamanBicimlendirme;
        }
      });
    } else {
      print("Time selection canceled!");
    }
  }

  Future<TimeOfDay?> _secilenZamaniGoster() async {
    return await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: const TimeOfDay(hour: 10, minute: 10),
    );
  }
}
