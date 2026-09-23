import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooker_cooker/provider/homeprovider.dart';
import 'package:provider/provider.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/gen/assets.gen.dart';
import 'package:hooker_cooker/screen/pishirishboshlash.dart';

class Customgridview extends StatelessWidget {
  const Customgridview({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider'ni kuzatib turamiz
    final provider = context.watch<HomeProvider>();

    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: provider.ovqatlar.length,
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final ovqat = provider.ovqatlar[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Pishirishniboshlash(model: ovqat),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 122,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(ovqat.videoUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
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
                                '${ovqat.daqiqa.toInt()} daq',
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
                      // Yurakcha (Favorite) tugmasi - Provider orqali boshqariladi
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            // Provider'dagi funksiya chaqiriladi
                            context.read<HomeProvider>().toggleFavorite(index);
                          },
                          child: CircleAvatar(
                            backgroundColor: Cols.white,
                            radius: 17,
                            child: Icon(
                              ovqat.yurak
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: ovqat.yurak ? Cols.danger : Cols.dark,
                            ),
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
                          ovqat.nomi,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          ovqat.turi,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Divider(height: 1, color: Cols.divider),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.star, color: Cols.warning, size: 15),
                            Text(
                              ovqat.reyting.toString(),
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Cols.warning,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              ovqat.insonga.toString(),
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
