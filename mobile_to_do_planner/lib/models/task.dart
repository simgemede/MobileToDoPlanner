class Task {
  int? id;
  String baslik;
  String? not;
  String tarih;
  String baslangicZamani;
  String bitisZamani;
  int hatirlatici;
  String tekrar;

  Task({
    this.id,
    required this.baslik,
    this.not,
    required this.tarih,
    required this.baslangicZamani,
    required this.bitisZamani,
    required this.hatirlatici,
    required this.tekrar,
  });

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json['id'],
        baslik: json['baslik'],
        not: json['not'],
        tarih: json['tarih'],
        baslangicZamani: json['baslangicZamani'],
        bitisZamani: json['bitisZamani'],
        hatirlatici: json['hatirlatici'],
        tekrar: json['tekrar'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'baslik': baslik,
        'not': not,
        'tarih': tarih,
        'baslangicZamani': baslangicZamani,
        'bitisZamani': bitisZamani,
        'hatirlatici': hatirlatici,
        'tekrar': tekrar,
      };
}
