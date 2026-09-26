import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/screen/tayyorlash.dart';
import 'package:hooker_cooker/screen/video.dart';
import 'package:hooker_cooker/widget/masaliqlartab.dart';
import 'package:hooker_cooker/widget/pisheleventbuten.dart';
import 'package:hooker_cooker/widget/pishirishmasaliqlari.dart';
import 'package:hooker_cooker/widget/videocont.dart';

class Pishirishniboshlash extends StatelessWidget {
  final dynamic model;
  const Pishirishniboshlash({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cols.canvas,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Videocont(model: model),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Pishirishmasaliqlari(
                    vaqt: model.daqiqa.toString(),
                    daraja: model.daraja,
                    porsiya: model.insonga.toString(),
                  ),
                  const SizedBox(height: 20),
                  Masaliqlartab(model: model),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PishirishniBoshlashButton(
        onPressed: () {
          final String? imageUrl = model?.videoUrl;
          final bool imagebor = imageUrl != null && imageUrl.isNotEmpty;

          if (imagebor) {
            if (imageUrl.startsWith('http://') ||
                imageUrl.startsWith('https://')) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Qaysi birini tanlaysiz'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Video(model: model),
                            ),
                          );
                        },
                        child: Text('Video'),
                      ),
                      TextButton(
                        onPressed: () {
                       
                         Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Tayyorlash(model: model),
                            ),
                          );
                        },
                        child: Text('Qadam'),
                      ),
                    ],
                  );
                },
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Tayyorlash(model: model),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
