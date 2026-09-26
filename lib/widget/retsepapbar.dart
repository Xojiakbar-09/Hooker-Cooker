import 'package:flutter/material.dart';
import 'package:hooker_cooker/provider/retseptprovider.dart';
import 'package:hooker_cooker/widget/sanekebar.dart';
// ignore: undefined_hidden_name
import 'package:hooker_cooker/widget/snekbar.dart' hide showPrimaryTopSnackBar;
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
        TextButton(
          onPressed: () async {
            final provider = context.read<RetseptProvider>();

            String? xatolik = await provider.retseptniSqflitegaSaqlash();
            if (!context.mounted) return;

            if (xatolik == null) {
              showPrimaryTopSnack(context, "Muvofaqiyatli saqlandi");
              if (!context.mounted) return;
              Navigator.pop(context);
            } else {
              showErrorTopSnackBar(context, xatolik);
            }
          },
          child: const Text("Saqlash"),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
