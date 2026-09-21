import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/screen/tayyorlash.dart';
import 'package:hooker_cooker/widget/masaliqlartab.dart';
import 'package:hooker_cooker/widget/pisheleventbuten.dart';
import 'package:hooker_cooker/widget/pishirishmasaliqlari.dart';
import 'package:hooker_cooker/widget/videocont.dart';

class Pishirishniboshlash extends StatefulWidget {
  final dynamic model;
  const Pishirishniboshlash({super.key, required this.model});

  @override
  State<Pishirishniboshlash> createState() => _PishirishboshlashState();
}

class _PishirishboshlashState extends State<Pishirishniboshlash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cols.canvas,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Videocont(model: widget.model),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Pishirishmasaliqlari(
                    vaqt: widget.model.daqiqa.toString(),
                    daraja: widget.model.daraja,
                    porsiya: widget.model.insonga.toString(),
                  ),
                  SizedBox(height: 20),
                  Masaliqlartab(model: widget.model),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PishirishniBoshlashButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Tayyorlash(model: widget.model),
            ),
          );
        },
      ),
    );
  }
}
