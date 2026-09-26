import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooker_cooker/provider/boshlashprovider.dart';
import 'package:provider/provider.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:share_plus/share_plus.dart';

class Videocont extends StatelessWidget {
  final dynamic model;
  const Videocont({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BoshlashProvider>();

    final String? imageUrl = model?.videoUrl;
    final bool imagebor = imageUrl != null && imageUrl.isNotEmpty;


    ImageProvider? finalImageProvider;
    if (imagebor) {
      if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
        finalImageProvider = NetworkImage(imageUrl);
      } else {
        finalImageProvider = FileImage(File(imageUrl));
      }
    }

    return Stack(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.35,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: imagebor
                ? null
                : LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Cols.divider,
                      Cols.divider,
                      Cols.divider,
                      Cols.dark,
                    ],
                  ),
            image: imagebor && finalImageProvider != null
                ? DecorationImage(image: finalImageProvider, fit: BoxFit.cover)
                : null,
          ),
          child: !imagebor
              ? const Center(
                  child: Icon(Icons.photo, size: 60, color: Colors.grey),
                )
              : null,
        ),

        
        Positioned(
          top: 5,
          left: 20,
          right: 20,
          child: SafeArea(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                    backgroundColor: Cols.orange,
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    final imagepath = model.videoUrl;

                    if (imagepath != null && imagepath.isNotEmpty) {
                      // Agar internet havolasi bo'lsa
                      if (imagepath.startsWith('http://') ||
                          imagepath.startsWith('https://')) {
                        // ignore: deprecated_member_use
                        Share.share(
                          "Taom nomi: ${model.nomi}\nTaom turi: ${model.turi}\nKo'rish uchun havola: $imagepath",
                        );
                      } else {
                        // ignore: deprecated_member_use
                        Share.shareXFiles([XFile(imagepath)], text: model.nomi);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Ulashish uchun ma'lumot mavjud emas"),
                        ),
                      );
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: Cols.orange,
                    child: const Icon(Icons.share, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                // Yurak tugmasi
                GestureDetector(
                  onTap: () {
                    provider.yurakniBoshqarish(model);
                  },
                  child: CircleAvatar(
                    backgroundColor: Cols.orange,
                    child: Icon(
                      model.yurak == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: model.yurak == true ? Cols.danger : Cols.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Cols.orange,
                ),
                child: Text(model.turi, style: TextStyle(color: Cols.white)),
              ),
              Text(
                model.nomi,
                style: TextStyle(
                  color: Cols.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
