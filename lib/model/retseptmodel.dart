import 'dart:convert';

class MasalliqModel {
  final String nomi;
  final String miqdori;

  MasalliqModel({required this.nomi, required this.miqdori});

  Map<String, dynamic> toMap() {
    return {'nomi': nomi, 'miqdori': miqdori};
  }

  factory MasalliqModel.fromMap(Map<String, dynamic> map) {
    return MasalliqModel(
      nomi: map['nomi'] ?? '',
      miqdori: map['miqdori'] ?? '',
    );
  }
}

class RetseptModel {
  final int? id;
  final String imagePath;
  final String nomi;
  final String portsiya;
  final String vaqt;
  final List<MasalliqModel> masalliqlar;
  final List<String> qadamlar;

  RetseptModel({
    this.id,
    required this.imagePath,
    required this.nomi,
    required this.portsiya,
    required this.vaqt,
    required this.masalliqlar,
    required this.qadamlar,
  });

  // Sqflite bazasiga saqlash uchun Map ga o'girish
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'imagePath': imagePath,
      'nomi': nomi,
      'portsiya': portsiya,
      'vaqt': vaqt,
      // Ro'yxatlarni JSON matnga aylantiramiz
      'masalliqlar': jsonEncode(masalliqlar.map((e) => e.toMap()).toList()),
      'qadamlar': jsonEncode(qadamlar),
    };
  }

  // Sqflite bazasidan o'qib olish
  factory RetseptModel.fromMap(Map<String, dynamic> map) {
    return RetseptModel(
      id: map['id'],
      imagePath: map['imagePath'] ?? '',
      nomi: map['nomi'] ?? '',
      portsiya: map['portsiya'] ?? '',
      vaqt: map['vaqt'] ?? '',
      masalliqlar: (jsonDecode(map['masalliqlar']) as List)
          .map((e) => MasalliqModel.fromMap(e))
          .toList(),
      qadamlar: List<String>.from(jsonDecode(map['qadamlar'])),
    );
  }
}