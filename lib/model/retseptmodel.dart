import 'dart:convert';
import 'package:hooker_cooker/model/ingredient.dart';

class RetseptModel {
   bool yurak;
  final String audio;
  final int? id;
  final String imagePath;
  final String nomi;
  final String portsiya;
  final String vaqt;
  final List<Ingredient> masalliqlar;
  final List<String> qadamlar;

  bool get sersa => yurak; 
  set sersa(bool value) => yurak = value;

  String get daqiqa => vaqt;
  String get daraja => "O'rtacha";
  String get insonga => portsiya;
  String get videoUrl => imagePath;
  String get turi => 'milliy taom';
  String? get video => videoUrl;

  RetseptModel({
    this.id,
    required this.imagePath,
    required this.nomi,
    required this.portsiya,
    required this.vaqt,
    required this.masalliqlar,
    required this.qadamlar,
    required this.audio,
    required this.yurak, 
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'imagePath': imagePath,
      'nomi': nomi,
      'portsiya': portsiya,
      'vaqt': vaqt,
      'masalliqlar': jsonEncode(masalliqlar.map((e) => e.toMap()).toList()),
      'qadamlar': jsonEncode(qadamlar),
      'audio': audio,
      'sersa': yurak ? 1 : 0, 
    };
  }

  factory RetseptModel.fromMap(Map<String, dynamic> map) {
    return RetseptModel(
      // Bazadagi sersa qiymatini yurakka o'qib olamiz
      yurak: map['sersa'] == 1 || map['sersa'] == true, 
      audio: map['audio'] ?? '',
      id: map['id'],
      imagePath: map['imagePath'] ?? '',
      nomi: map['nomi'] ?? '',
      portsiya: map['portsiya'] ?? '',
      vaqt: map['vaqt'] ?? '',
      masalliqlar: map['masalliqlar'] != null
          ? (jsonDecode(map['masalliqlar']) as List)
              .map((e) => Ingredient.fromMap(e))
              .toList()
          : [],
      qadamlar: map['qadamlar'] != null
          ? List<String>.from(jsonDecode(map['qadamlar']))
          : [],
    );
  }
}