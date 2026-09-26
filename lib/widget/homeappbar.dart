import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';

class Homeappbar extends StatelessWidget implements PreferredSizeWidget {
  const Homeappbar({super.key});

  
  String getUsername() {
    String rawEmail = GetStorage().read('user_email') ?? 'Foydalanuvchi';
    
    if (rawEmail.contains('@')) {
      return rawEmail.split('@')[0]; 
    }
    return rawEmail;
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      toolbarHeight: 65,
      backgroundColor: Cols.canvas,
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " ${getUsername()} kundaligi !",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            "Mening shoh asarlarim",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Cols.dark,
            ),
          ),
        ],
      ),
      actionsPadding: const EdgeInsets.only(right: 20, top: 10),
      actions: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Cols.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: const Icon(Icons.tune, color: Colors.grey, size: 20),
          ),
        ),
      ],
    );
  }
}
