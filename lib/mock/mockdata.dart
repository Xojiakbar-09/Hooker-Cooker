import 'package:flutter/material.dart';

class OvqatMock {
  static final List<Ovqat> mockOvqatlar = [
    // 1. Toshkentcha to'y oshi
    Ovqat(
      yurak: false,
      nomi: "Toshkentcha to'y oshi",
      turi: "Milliy taom",
      insonga: "2",
      daqiqa: 120.0,
      reyting: 4.9,

      daraja: "Qiyin", // <--- Daraja qo'shildi
      discribtion:
          "O'zbek milliy oshxonasining shoh taomi, bayram va to'ylarning ko'rki.",
      videoUrl:
          "https://tse2.mm.bing.net/th/id/OIP.Px01rF3Qhg8pp0KUCvFTYgHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      masalliqlar: [
        Masalliq(
          isChecked: false,
          nomi: "Lazer guruchi",
          izoh: "Saralab yuvilgan",
          miqdori: "1 kg",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Qo'y go'shti (laxtak)",
          izoh: "Yirik bo'laklangan",
          miqdori: "1 kg",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Sariq sabzi",
          izoh: "Somoncha to'g'ralgan",
          miqdori: "1 kg",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Dumba yog'i",
          izoh: "Eritish uchun",
          miqdori: "200 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Zira va zirk",
          izoh: "Hidi o'tkir mayda zira",
          miqdori: "2 osh qoshiq",
        ),
      ],
      qadamlar: [
        "Qozonda dumba yog'ini eritib, jizzani olamiz.",
        "Piyoz va go'shtni solib, tillaranggacha qovuramiz.",
        "Sabzini solib, qovurishda davom etamiz va suv quyib zirvak tayyorlaymiz.",
        "Guruchni yuvib, zirvak ustiga tekis solamiz.",
        "Suvi tortilgach, oshni damlaymiz va 45 daqiqa pishiramiz.",
      ],
    ),
    // 2. An'anaviy Manti
    Ovqat(
      yurak: false,
      nomi: "An'anaviy Manti",
      turi: "Milliy taom",
      insonga: "4",
      daqiqa: 90.0,
      reyting: 4.8,

      daraja: "Qiyin",
      discribtion:
          "Bug'da pishiriladigan, sershira va mazali go'shtli xamir ovqat.",
      videoUrl:
          "https://tse1.mm.bing.net/th/id/OIP.nwDXLx8A--kQYSEkq6JaiwHaEv?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      masalliqlar: [
        Masalliq(
          isChecked: false,
          nomi: "A'lo navli un",
          izoh: "Xamir uchun",
          miqdori: "500 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Mol go'shti",
          izoh: "Mayda to'g'ralgan",
          miqdori: "700 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Piyoz",
          izoh: "Mayda to'g'ralgan",
          miqdori: "1 kg",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Dumba yog'i",
          izoh: "Manti ichiga",
          miqdori: "150 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Murch va zira",
          izoh: "Ta'mga ko'ra",
          miqdori: "1 choy qoshiq",
        ),
      ],
      qadamlar: [
        "O'rtacha qattiqlikda xamir qorib, 20 daqiqa dambas beramiz.",
        "Qiymasi uchun go'sht, piyoz, dumba va ziravorlarni aralashtiramiz.",
        "Xamirni yoyib, kvadratchalar kesamiz va qiymani solib tugamiz.",
        "Mantikaskonga terib, 45 daqiqa bug'da pishiramiz.",
      ],
    ),
    // 3. Uycha Lag'mon
    Ovqat(
      yurak: false,
      nomi: "Uyg'urcha Lag'mon",
      turi: "Suyuq ovqat",
      insonga: "2",
      daqiqa: 80.0,
      reyting: 4.7,

      daraja: "Qiyin",
      discribtion:
          "Cho'zilma xamir va maxsus tansiq sabzavotli qayla uyg'unligi.",
      videoUrl:
          "https://zira.uz/wp-content/uploads/2018/06/uygurskiy-lagman-4.jpg",
      masalliqlar: [
        Masalliq(
          isChecked: false,
          nomi: "Un va tuxum",
          izoh: "Xamir cho'zish uchun",
          miqdori: "600 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Mol go'shti",
          izoh: "Yupqa to'g'ralgan",
          miqdori: "400 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Bulg'or qalampiri",
          izoh: "Qizil va yashil",
          miqdori: "2 dona",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Pomidor va sarimsoq",
          izoh: "Qayla uchun",
          miqdori: "3 dona",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Pekinka karami",
          izoh: "To'g'ralgan",
          miqdori: "200 gr",
        ),
      ],
      qadamlar: [
        "Tuxum va tuzli suvdan xamir qorib, yog'lab tindiramiz.",
        "Xamirni ingichka qilib cho'zamiz va qaynatib olamiz.",
        "Qozonda go'sht, piyoz va barcha sabzavotlarni tez olovda qovuramiz.",
        "Biroz suv quyib qaylani pishirib olamiz.",
        "Pishgan xamir ustiga qayla solib tortiq qilamiz.",
      ],
    ),
    // 4. Qarsildoq Somsa
    Ovqat(
      yurak: false,
      nomi: "Qarsildoq Somsa",
      turi: "Pishiriq",
      insonga: "1",
      daqiqa: 70.0,
      reyting: 4.9,

      daraja: "Qiyin",
      discribtion:
          "Tandirda yoki pechda yopiladigan qat-qat va sershira somsa.",
      videoUrl:
          "https://th.bing.com/th/id/R.89385b04a29b4f10d47b485f9030c8c6?rik=X9RZWDdBRkAmkA&pid=ImgRaw&r=0",
      masalliqlar: [
        Masalliq(
          isChecked: false,
          nomi: "Oliy navli un",
          izoh: "Xamir uchun",
          miqdori: "600 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Sariyog' (Margarin)",
          izoh: "Qatlash uchun",
          miqdori: "250 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Qo'y go'shti",
          izoh: "Mayda to'g'ralgan",
          miqdori: "500 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Piyoz",
          izoh: "To'g'ralgan",
          miqdori: "600 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Zira, murch, tuz",
          izoh: "Ta'mga ko'ra",
          miqdori: "Yetarlicha",
        ),
      ],
      qadamlar: [
        "Oddiy xamir qorib yoyamiz, eritilgan sariyog' surtib rulet shaklida o'raymiz.",
        "Ruletni muzlatgichda 1-2 soat tindiramiz.",
        "Go'sht va piyozni to'g'rab, ziravorlar qo'shib qiyma tayyorlaymiz.",
        "Xamirni zuvalachalarga bo'lib, yoyib, qiyma solib tugamiz.",
        "Ustiga tuxum surtib, kunjut sepib, 200 gradusda 35-40 daqiqa pishiramiz.",
      ],
    ),
    // 5. Mastava
    Ovqat(
      yurak: false,
      nomi: "Mastava",
      turi: "Suyuq ovqat",
      insonga: "5",
      daqiqa: 50.0,
      reyting: 4.6,

      daraja: "O'rtacha",
      discribtion:
          "To'yimli, guruch va sabzavotlardan tayyorlanadigan milliy sho'rva.",
      videoUrl:
          "https://tse1.mm.bing.net/th/id/OIP.tECzTrLCLP1a3IEHhC_4ogHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      masalliqlar: [
        Masalliq(
          isChecked: false,
          nomi: "Guruch",
          izoh: "Yuvib ivitilgan",
          miqdori: "150 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Mol go'shti",
          izoh: "Mayda kubik to'g'ralgan",
          miqdori: "300 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Kartoshka va Sabzi",
          izoh: "Kubik qilib to'g'ralgan",
          miqdori: "2 donadan",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Pomidor va Piyoz",
          izoh: "Qovurish uchun",
          miqdori: "1 donadan",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Qatiq va Ko'katlar",
          izoh: "Ustiga bezak uchun",
          miqdori: "Ta'bga ko'ra",
        ),
      ],
      qadamlar: [
        "Qozonga ozroq yog' solib go'shtni qizartirib qovuramiz.",
        "Piyoz, sabzi va pomidorni solib qovurishda davom etamiz.",
        "Kartoshka solib aralashtiramiz va suv quyamiz.",
        "Suv qaynagach, yuvilgan guruchni solamiz.",
        "Guruch pishgach, ko'katlar sepib olovni o'chiramiz va qatiq bilan tortamiz.",
      ],
    ),
    // 6. Sezar Salati
    Ovqat(
      yurak: false,
      nomi: "Sezar Salati",
      turi: "Salat",
      insonga: "2",
      daqiqa: 25.0,
      reyting: 4.5,

      daraja: "Oson",
      discribtion:
          "Tovuq go'shti, suxari va maxsus sous bilan tayyorlanadigan yengil salat.",
      videoUrl:
          "https://evdar.az/wp-content/uploads/Dadli-v%C9%99-Yungul-Krevetkali-Sezar-Salati2.jpg",
      masalliqlar: [
        Masalliq(
          isChecked: false,
          nomi: "Tovuq filesi",
          izoh: "Qovurilgan yoki pishirilgan",
          miqdori: "200 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Aysberg salat bargi",
          izoh: "Yirik qilib uzilgan",
          miqdori: "1 ta",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Suxari",
          izoh: "Qovurilgan non bo'laklari",
          miqdori: "100 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Parmesan pishlog'i",
          izoh: "Qirg'ichdan o'tkazilgan",
          miqdori: "50 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Sezar sousi",
          izoh: "Mayonezli maxsus sous",
          miqdori: "3 qoshiq",
        ),
      ],
      qadamlar: [
        "Tovuq filesini tuz va murchlab, tovada ikki tomonini qovurib olamiz.",
        "Aysberg karamini qo'lda yirik bo'laklarga ajratib idishga solamiz.",
        "Pishgan tovuqni uzunchoq qilib kesib, karam ustiga teramiz.",
        "Suxari va maydalangan pishloqni sepamiz.",
        "Eng ustidan Sezar sousini quyamiz va tortiq qilamiz.",
      ],
    ),
    // 7. Pepperoni Pitsa
    Ovqat(
      yurak: false,
      nomi: "Pepperoni Pitsa",
      turi: "Fast food",
      insonga: "3",
      daqiqa: 35.0,
      reyting: 4.8,

      daraja: "O'rtacha",
      discribtion:
          "Italiya uslubidagi achchiqqina kolbasa va erigan pishloqli pitsa.",
      videoUrl:
          "https://tse4.mm.bing.net/th/id/OIP.jAD9aEjFF-FHHhK8hFzQ_wHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      masalliqlar: [
        Masalliq(
          isChecked: false,
          nomi: "Pitsa xamiri",
          izoh: "Oshirma xamir",
          miqdori: "1 ta",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Pepperoni kolbasasi",
          izoh: "Yupqa parrak qilingan",
          miqdori: "150 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Motsarella pishlog'i",
          izoh: "Qirg'ichdan o'tkazilgan",
          miqdori: "200 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Pomidor sousi",
          izoh: "Pitsa uchun maxsus",
          miqdori: "3-4 qoshiq",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Oregano (Ziravor)",
          izoh: "Xushbo'ylik uchun",
          miqdori: "Biroz",
        ),
      ],
      qadamlar: [
        "Pitsa xamirini yupqa qilib yoyib, patnisga joylaymiz.",
        "Xamir ustiga pomidor sousini tekis surtib chiqamiz.",
        "Motsarella pishlog'ini qalin qilib sepamiz.",
        "Ustiga pepperoni kolbasa parraklarini terib chiqamiz.",
        "220 gradus qizdirilgan pechda 10-15 daqiqa davomida pishiramiz.",
      ],
    ),
    // 8. Qozon Kabob
    Ovqat(
      yurak: false,
      nomi: "Qozon Kabob",
      turi: "Milliy taom",
      insonga: "4",
      daqiqa: 60.0,
      reyting: 4.9,

      daraja: "O'rtacha",
      discribtion:
          "Qozonda qovurilib, o'z sharbatida dimlanadigan xushbo'y go'sht.",
      videoUrl: "https://zira.uz/wp-content/uploads/2017/11/hiva-16.jpg",
      masalliqlar: [
        Masalliq(
          isChecked: false,
          nomi: "Qo'y qovurg'asi/go'shti",
          izoh: "Yirik bo'laklangan",
          miqdori: "1 kg",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Kartoshka",
          izoh: "O'rtacha kattalikda",
          miqdori: "1 kg",
        ),
        Masalliq(
          isChecked: false,
          nomi: "O'simlik yog'i",
          izoh: "Qovurish uchun",
          miqdori: "200 ml",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Zira, kashnich urug'i, tuz",
          izoh: "Go'shtni marinovka qilish uchun",
          miqdori: "Yetarlicha",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Piyoz va ko'katlar",
          izoh: "Bezatish uchun",
          miqdori: "1 ta",
        ),
      ],
      qadamlar: [
        "Go'shtni tuz va ziravorlar bilan aralashtirib biroz marinadlaymiz.",
        "Qizdirilgan yog'da archilgan butun kartoshkalarni tilla ranggacha qovurib, olib qo'yamiz.",
        "Xuddi shu yog'da go'shtni qizartirib qovurib olamiz.",
        "Yog'ning ko'p qismini to'kib tashlab, qozonga avval go'shtni, ustidan kartoshkani solamiz.",
        "Yarim piyola suv quyib, qozon qopqog'ini yopamiz va past olovda 45 daqiqa dimlaymiz.",
      ],
    ),
    // 9. Norin
    Ovqat(
      yurak: false,
      nomi: "Norin",
      turi: "Milliy taom",
      insonga: "8",
      daqiqa: 150.0,
      reyting: 4.9,

      daraja: "Qiyin",
      discribtion:
          "Qaynatma go'sht va yupqa yoyilib kesilgan xamirdan tayyorlanadigan taom.",
      videoUrl:
          "https://thumbs.dreamstime.com/b/norin-nacional-de-la-comida-del-uzbek-en-adras-tradicionales-de-la-tela-42176652.jpg",
      masalliqlar: [
        Masalliq(
          isChecked: false,
          nomi: "Ot yoki Mol go'shti",
          izoh: "Tuzlangan",
          miqdori: "1 kg",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Qazi",
          izoh: "Pishirilgan ot qazisi",
          miqdori: "1 dona",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Un va tuxum",
          izoh: "Xamir uchun",
          miqdori: "1 kg",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Piyoz",
          izoh: "Yupqa to'g'ralgan",
          miqdori: "3 dona",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Murch va Zira",
          izoh: "Xushbo'ylik uchun",
          miqdori: "Ta'bga ko'ra",
        ),
      ],
      qadamlar: [
        "Go'sht va qazini 2 soat davomida qaynatib pishiramiz (suviga tuz solamiz).",
        "Qattiq xamir qorib yoyamiz, to'rtburchak kesib go'sht sho'rvasida pishirib olamiz.",
        "Pishgan xamirlarni sovutib, yog'laymiz va mayda somoncha shaklida to'g'raymiz.",
        "Pishgan sovigan go'sht va qazini ham mayda somoncha qilib to'g'raymiz.",
        "To'g'ralgan xamir, go'sht, piyoz va murchni aralashtirib laganga solamiz.",
      ],
    ),
    // 10. Klub Sendvich
    Ovqat(
      yurak: false,
      nomi: "Klub Sendvich",
      turi: "Fast food",
      insonga: "1",
      daqiqa: 15.0,
      reyting: 4.4,

      daraja: "Oson",
      discribtion:
          "Non, tovuq go'shti, pomidor va maxsus sous qatlamli tezkor nonushta.",
      videoUrl:
          "https://tse1.explicit.bing.net/th/id/OIP.xqKYUoX_IQi9XPtpO6Nf8gHaLG?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
      masalliqlar: [
        Masalliq(
          isChecked: false,
          nomi: "Tost noni",
          izoh: "Kvadrat shaklidagi oq non",
          miqdori: "3 bo'lak",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Tovuq filesi",
          izoh: "Qovurilgan yoki dudlangan",
          miqdori: "100 gr",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Tuxum",
          izoh: "Qovurilgan quymoq (glazunya)",
          miqdori: "1 ta",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Pomidor va bodring",
          izoh: "Yupqa kesilgan",
          miqdori: "4 bo'lakdan",
        ),
        Masalliq(
          isChecked: false,
          nomi: "Mayonez va pishloq",
          izoh: "Xohishga ko'ra",
          miqdori: "1 bo'lak",
        ),
      ],
      qadamlar: [
        "Tost nonlarini toster yoki quruq tovada biroz qizartirib olamiz.",
        "Birinchi non ustiga mayonez surtib, salat bargi, tovuq filesi va pishloq qo'yamiz.",
        "Ikkinchi nonni qo'yib, ustiga qovurilgan tuxum, pomidor va bodringni joylaymiz.",
        "Uchinchi non bilan yopib, ustidan biroz bosamiz.",
        "Diagonaliga kesib, orasiga cho'pchaq tiqib tortamiz.",
      ],
    ),
  ];
}

class Masalliq {
  bool isChecked;
  final String nomi;
  final String izoh;
  final String miqdori;

  Masalliq({
    required this.nomi,
    required this.izoh,
    required this.miqdori,
    required this.isChecked,
  });
}

class Ovqat {
  final String daraja;
  bool yurak;
  final String insonga;
  final double daqiqa;
  final String turi;
  final String nomi;
  final double reyting;
  final String discribtion;
  final List<Masalliq> masalliqlar;
  final List<String> qadamlar;
  final String videoUrl;

  Ovqat({
    required this.reyting,
    required this.yurak,
    required this.discribtion,
    required this.insonga,
    required this.daqiqa,
    required this.turi,
    required this.nomi,
    required this.masalliqlar,
    required this.qadamlar,
    required this.videoUrl,
    required this.daraja,
  });
}
