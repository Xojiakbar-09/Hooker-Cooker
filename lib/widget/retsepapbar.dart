import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/provider/retseptprovider.dart';
import 'package:provider/provider.dart';

class AddRecipeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AddRecipeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      leadingWidth: 100,
      leading: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Bekor qilish',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        'Yangi Retsept',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            final provider = context.read<RetseptProvider>();
            bool mufavvaqiyatli = await provider.retseptniSqflitegaSaqlash();

            if (mufavvaqiyatli) {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Retsept sqflite bazasiga saqlandi!"),
                ),
              );
              // ignore: use_build_context_synchronously
              Navigator.pop(context); // Ekranni yopish
            } else {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Iltimos, taom nomini kiriting!")),
              );
            }
          },
          child: const Text("Saqlash"),
        ),
        SizedBox(width: 8),
      ],
    );
  }
}
