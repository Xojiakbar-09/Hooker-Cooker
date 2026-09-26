import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/gen/assets.gen.dart';
import 'package:hooker_cooker/provider/retseptprovider.dart';
import 'package:hooker_cooker/screen/pishirishboshlash.dart';
import 'package:hooker_cooker/widget/kalleysiyaimage.dart';
import 'package:provider/provider.dart';

class Kolleksiya extends StatelessWidget {
  const Kolleksiya({super.key});

  @override
  Widget build(BuildContext context) {
    final retseptlar = context.watch<RetseptProvider>().retseptlar;

    return Scaffold(
      backgroundColor: Cols.canvas,
      body: retseptlar.isEmpty
          ? const Center(
              child: Text(
                "Hozircha retseptlar mavjud emas",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: retseptlar.length,
              itemBuilder: (context, index) {
                final retseptModel = retseptlar[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Pishirishniboshlash(model: retseptModel),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20), 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 122,
                                width: double.infinity,
                                color: Cols.divider,
                                child: buildRetseptImage(retseptModel.imagePath),
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Cols.white,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.icons.timer,
                                        // ignore: deprecated_member_use
                                        color: Cols.dark,
                                        height: 12,
                                        width: 12,
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        "${retseptModel.vaqt} daq",
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600,
                                          color: Cols.dark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            color: Cols.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  retseptModel.nomi,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Divider(height: 1, color: Cols.divider),
                                const SizedBox(height: 10),
                                Text(
                                  retseptModel.portsiya.toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}