import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/gen/assets.gen.dart';
import 'package:hooker_cooker/mock/mockdata.dart';

class Saqlangan extends StatefulWidget {
  const Saqlangan({super.key});

  @override
  State<Saqlangan> createState() => _SaqlanganState();
}

class _SaqlanganState extends State<Saqlangan> {
  @override
  Widget build(BuildContext context) {
    // Har safar build bo'lganda mock datadan yuragi true bo'lganlarni filter qiladi
    final favourite = OvqatMock.mockOvqatlar
        .where((item) => item.yurak == true)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Saqlanganlar"), centerTitle: true),
      body: favourite.isEmpty
          ? const Center(
              child: Text(
                "Hozircha saqlanganlar yo'q",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favourite.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final ovqat = favourite[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(ovqat.videoUrl),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: Cols.divider,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    Assets.icons.timer,
                                    colorFilter: ColorFilter.mode(
                                      Cols.dark,
                                      BlendMode.srcIn,
                                    ),
                                    height: 12,
                                    width: 12,
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    '${ovqat.daqiqa} daq',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Cols.dark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  ovqat.yurak = !ovqat.yurak;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 17,
                                child: Icon(
                                  ovqat.yurak
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: ovqat.yurak ? Cols.danger : Cols.dark,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}