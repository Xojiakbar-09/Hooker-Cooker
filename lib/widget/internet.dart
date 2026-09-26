import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/main.dart';

class NOinternet extends StatelessWidget {
  const NOinternet({super.key});

  static void conkorsat() {
    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      context: navigatorkey.currentState!.context,
      builder: (context) => NOinternet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        height: MediaQuery.sizeOf(context).height * 0.5,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Cols.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox( height: MediaQuery.sizeOf(context).height * 0.1),
              IconButton(
                icon: Icon(Icons.wifi_off, size: 40),
                onPressed: () {
                  AppSettings.openAppSettings(type: AppSettingsType.wifi);
                },
              ),
              SizedBox(height: 20),
              Text(
                'Internet mavjud emas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Cols.dark,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Iltimos internetga ulaning',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Cols.dark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
