import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/gen/assets.gen.dart';
import 'package:hooker_cooker/provider/loginpovider.dart';
import 'package:hooker_cooker/screen/mainscrren.dart';
import 'package:hooker_cooker/widget/customcard.dart';
import 'package:hooker_cooker/widget/customdropdawn.dart';
import 'package:hooker_cooker/widget/customelevent.dart';
import 'package:hooker_cooker/widget/customtextfield.dart';
import 'package:provider/provider.dart';


 
  bool isdark = false;
  bool isbell = false;


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cols.divider,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ChangeNotifierProvider(
            create: (context) => Loginpovider(),
            child: Builder(
              builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      'Hooker Cooker',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Shinam oshxona, lazzatli taomlar siri',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 14),

                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 9),
                      child: Customtextfield(
                        formKey: _formKey,
                        emailController: _emailController,
                        passwordController: _passwordController,
                      ),
                    ),

                    Customelevent(
                      push: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        }
                      },
                      text: "Tizimga kirish",
                      icon: const Icon(Icons.arrow_forward_rounded, size: 20),
                    ),

                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          'TEZKOR SOZLAMALAR',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Card(
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
                    const SizedBox(height: 110),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Apple ID orqali davom etish yoki',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Text(
                          " Ro'yxatdan o'tish",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Cols.primery,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
