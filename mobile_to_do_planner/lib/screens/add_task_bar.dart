import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_to_do_planner/UI/button.dart';
import 'package:mobile_to_do_planner/UI/input_field.dart';
import 'package:mobile_to_do_planner/controllers/task_conrollers.dart';
import 'package:mobile_to_do_planner/controllers/task_controller.dart';
import 'package:mobile_to_do_planner/models/task.dart';

class GorevBariSayfasi extends StatefulWidget {
  const GorevBariSayfasi({super.key});

  @override
  State<GorevBariSayfasi> createState() => _GorevBariSayfasiState();
}

class _GorevBariSayfasiState extends State<GorevBariSayfasi> {
  final GorevDenetleyicisi _taskController = Get.put(GorevDenetleyicisi());
  final TextEditingController _baslikController = TextEditingController();
  final TextEditingController _notController = TextEditingController();
  DateTime _seciliGun = DateTime.now();
  String _bitisZamani = " ";
  String _baslangicZamani =
      DateFormat("HH:mm").format(DateTime.now()).toString();
  String? _profilFotoUrl;
  int hatirlatici = 5;
  List<int> hatirlaticiListe = [
    5,
    10,
    15,
    20,
  ];

  String _tekrar = "None";
  List<String> tekrarListe = ["None", "Daily", "Weekly", "Monthly"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: uygulama_cubugu(),
      body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Add Task",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              GirisAlani(
                baslik: "Title",
                ipucu: "Enter your title",
                kontrol: _baslikController,
              ),
              GirisAlani(
                baslik: "Note",
                ipucu: "Enter your note",
                kontrol: _notController,
              ),
              GirisAlani(
                baslik: "Date",
                ipucu: DateFormat.yMd().format(_seciliGun),
                widget: IconButton(
                  icon: Icon(Icons.calendar_today_outlined),
                  onPressed: () {
                    _tarihAl();
                  },
                ),
                kontrol: null,
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
                      onPressed: () {
                        _zamanAl(baslangicZamaniMi: true);
                      },
                    ),
                    kontrol: null,
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
                    kontrol: null,
                  ))
                ],
              ),
              GirisAlani(
                baslik: "Remind",
                ipucu: "$hatirlatici minutes early",
                widget: DropdownButton<int>(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 30,
                  elevation: 4,
                  underline: Container(
                    height: 0,
                  ),
                  value: hatirlatici,
                  onChanged: (int? yeniDeger) {
                    if (yeniDeger != null) {
                      setState(() {
                        hatirlatici = yeniDeger;
                      });
                    }
                  },
                  items: hatirlaticiListe.map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
                kontrol: null,
              ),
              GirisAlani(
                baslik: "Repeat",
                ipucu: _tekrar,
                widget: DropdownButton<String>(
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 30,
                  elevation: 4,
                  underline: Container(
                    height: 0,
                  ),
                  value: _tekrar,
                  onChanged: (String? yeniDeger) {
                    if (yeniDeger != null) {
                      setState(() {
                        _tekrar = yeniDeger;
                      });
                    }
                  },
                  items: tekrarListe.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    );
                  }).toList(),
                ),
                kontrol: null,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Butonum(label: "Create Task", onTap: () => _tarihiDogrula())
                ],
              )
            ]),
          )),
    );
  }

  _tarihiDogrula() {
    if (_baslikController.text.isNotEmpty && _notController.text.isNotEmpty) {
      _dbyeGorevEkle();
      Get.back();
    } else if (_baslikController.text.isEmpty || _notController.text.isEmpty) {
      Get.snackbar("Required", "All fields are required!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromARGB(255, 197, 197, 197),
          icon: Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ));
    }
  }

  _dbyeGorevEkle() async {
    int value = await GorevDenetleyicisi.GorevEkle(
        task: Task(
            baslik: _baslikController.text,
            not: _notController.text,
            tarih: DateFormat.yMd().format(_seciliGun),
            baslangicZamani: _baslangicZamani,
            bitisZamani: _bitisZamani,
            hatirlatici: hatirlatici,
            tekrar: _tekrar));

    print("My id is " + "$value");
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
      String _zamanBicimlendirme =
          "${secilenZaman.hour.toString().padLeft(2, '0')}:${secilenZaman.minute.toString().padLeft(2, '0')}";
      setState(() {
        if (baslangicZamaniMi) {
          _baslangicZamani = _zamanBicimlendirme;

          TimeOfDay bitisZamani = TimeOfDay(
              hour: (secilenZaman.minute + 1) >= 60
                  ? (secilenZaman.hour + 1) % 24
                  : secilenZaman.hour,
              minute: (secilenZaman.minute + 1) % 60);
          _bitisZamani =
              "${bitisZamani.hour.toString().padLeft(2, '0')}:${bitisZamani.minute.toString().padLeft(2, '0')}";
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
