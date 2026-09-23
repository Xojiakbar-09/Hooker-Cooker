import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooker_cooker/consts/theme/theme.dart';
import 'package:hooker_cooker/provider/boshlashprovider.dart';
import 'package:hooker_cooker/provider/homeprovider.dart';
import 'package:hooker_cooker/provider/loginpovider.dart';
import 'package:hooker_cooker/provider/retseptprovider.dart';
import 'package:hooker_cooker/provider/saqlanganprovider.dart';
import 'package:hooker_cooker/provider/tayyorlash.dart';
import 'package:hooker_cooker/screen/login.dart';
import 'package:hooker_cooker/screen/mainscrren.dart';
import 'package:hooker_cooker/screen/saqlangan.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  ChangeNotifierProvider(
    create: (context) => RetseptProvider(),
    child: const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => SaqlanganProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RetseptProvider()),
        ChangeNotifierProvider(create: (_) => BoshlashProvider()),
        ChangeNotifierProvider(create: (_) => TayyorlashProvider()),
      ],
      child: MaterialApp(
        title: 'Hooker cooker',
        theme: Apptheme.light,
        debugShowCheckedModeBanner: false,

        home:
            //  Login()
            GetStorage().read('kirish') == null ||
                GetStorage().read('kirish') == false
            ? Login()
            : MainScreen(),
      ),
    );
  }
}
