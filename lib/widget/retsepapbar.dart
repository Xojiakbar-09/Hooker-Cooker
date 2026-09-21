import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';

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
        child:  Text(
          'Bekor qilish',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      centerTitle: true,
      title:  Text(
        'Yangi Retsept',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
           
          },
          child: Text(
            'Saqlash',
            style: TextStyle(
              color: Cols.primery, 
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
         SizedBox(width: 8), 
      ],
    );
  }
}