import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/gen/assets.gen.dart';

class Customsearch extends StatelessWidget {
  const Customsearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      cursorColor: Cols.dark,
      cursorErrorColor: Cols.white,
      cursorWidth: 1,
      cursorHeight: 20,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        filled: true,
        fillColor: Cols.divider,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        prefixIcon: Transform.scale(
          scale: 0.4,
          child: SvgPicture.asset(
            Assets.icons.search,
            height: 3,
            width: 3,
            // ignore: deprecated_member_use
            color: Colors.grey.shade500,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintText: 'Jahon taomlari qidiruvi',
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      ),
    );
  }
}
