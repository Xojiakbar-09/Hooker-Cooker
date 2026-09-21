import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';

class Tayyorlashappbar extends StatelessWidget implements PreferredSizeWidget {
  const Tayyorlashappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Cols.dark,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 5, backgroundColor: Cols.primery),
          const SizedBox(width: 5),
          Text(
            'TAYYORLASHNI BOSHLADIK',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Cols.white,
            ),
          ),
        ],
      ),
      leadingWidth: 70,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Transform.scale(
          scale: 0.7,
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            child: const Icon(Icons.close, color: Colors.white),
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.only(right: 10),
      actions: [
        GestureDetector(
          onTap: () {
          },
          child: Transform.scale(
            scale: 0.8,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: const Icon(Icons.volume_up_rounded, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}