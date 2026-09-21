import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/gen/assets.gen.dart';
import 'package:hooker_cooker/screen/login.dart';
import 'package:hooker_cooker/widget/customcard.dart';
import 'package:hooker_cooker/widget/customdropdawn.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cols.canvas,
      appBar: AppBar(
         backgroundColor: Cols.canvas,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                children: [
                  Customcard(
                    widget: Switch.adaptive(
                      value: isdark,
                      // ignore: deprecated_member_use
                      activeColor: Colors.white,
                      activeTrackColor: const Color(0xFFFF5200),
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: const Color(0xFFE5E7EB),
                      trackOutlineColor: WidgetStateProperty.all(
                        Colors.transparent,
                      ),
                      onChanged: (val) {
                        setState(() {
                          isdark = val;
                        });
                      },
                    ),
                    title: 'Qora mavzu',
                    subtitle: "Tungi o'qish uchun qulay",
                    rang: Cols.dark,
                    icon: SvgPicture.asset(Assets.icons.moon2),
                  ),
                  Customcard(
                    widget: const Customdropdawn(),
                    title: "Ovqatlanish ratsioni",
                    subtitle: "Taom turlari filtri",
                    rang: Cols.success,
                    icon: SvgPicture.asset(Assets.icons.barg),
                  ),
                  Customcard(
                    widget: Switch.adaptive(
                      value: isbell,
                      // ignore: deprecated_member_use
                      activeColor: Colors.white,
                      activeTrackColor: const Color(0xFFFF5200),
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: const Color(0xFFE5E7EB),
                      trackOutlineColor: WidgetStateProperty.all(
                        Colors.transparent,
                      ),
                      onChanged: (val) {
                        setState(() {
                          isbell = val;
                        });
                      },
                    ),
                    title: "Tayyor bo'lish xabari",
                    subtitle: "Taymer signallari",
                    rang: Cols.primery,
                    icon: SvgPicture.asset(Assets.icons.bell),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
