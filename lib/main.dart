import 'package:flutter/material.dart'
    show WidgetsFlutterBinding, runApp, Widget, BuildContext, MaterialApp, NavigatorState;
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooker_cooker/consts/theme/app_theme.dart';
import 'package:hooker_cooker/provider/boshlashprovider.dart';
import 'package:hooker_cooker/provider/homeprovider.dart';
import 'package:hooker_cooker/provider/loginpovider.dart';
import 'package:hooker_cooker/provider/retseptprovider.dart';
import 'package:hooker_cooker/provider/saqlanganprovider.dart';
import 'package:hooker_cooker/provider/tayyorlash.dart';
import 'package:hooker_cooker/screen/mainscrren.dart';
import 'package:hooker_cooker/screen/splesh.dart';
import 'package:hooker_cooker/service/internetserver.dart';
import 'package:provider/provider.dart';



final GlobalKey<NavigatorState> navigatorkey = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  void initState() {
    super.initState();
       Internetsarves.lisenConnetion();
  }

  @override
  Widget build(BuildContext context) {
    final bool tekshiruv = GetStorage().read('kirish') ?? false;

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
        navigatorKey: navigatorkey ,
        title: 'Hooker cooker',
        theme: Apptheme.light,
        debugShowCheckedModeBanner: false,
        home: 
        // Login()
        tekshiruv ? MainScreen() : SplashPage(),
      ),
    );
  }
}
