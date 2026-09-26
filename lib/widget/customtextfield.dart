import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooker_cooker/provider/loginpovider.dart';
import 'package:provider/provider.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/gen/assets.gen.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LoginProvider>();
    return Form(
      key: provider.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: provider.emailController,
            validator: provider.validateEmail,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Cols.dark,
            cursorErrorColor: Cols.white,
            cursorWidth: 1,
            cursorHeight: 20,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 0, height: 0),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              prefixIcon: Transform.scale(
                scale: 0.7,
                child: SvgPicture.asset(
                  Assets.icons.email,
                  height: 5,
                  width: 5,
                ),
              ),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'Email',
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Cols.dark,
              ),
            ),
          ),

          Divider(height: 1, color: Cols.canvas),

          TextFormField(
            controller: provider.passwordController,
            validator: provider.validatePassword,
            cursorErrorColor: Cols.dark,
            cursorColor: Cols.white,
            cursorWidth: 1,
            cursorHeight: 20,
            obscureText: provider.isObscure,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              prefixIcon: Transform.scale(
                scale: 0.7,
                child: SvgPicture.asset(Assets.icons.lock, height: 3, width: 3),
              ),
              errorStyle: const TextStyle(fontSize: 0, height: 0),
              suffixIcon: TextButton(
                style: TextButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: provider.toggleObscure,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    provider.isObscure ? "Ko'rish" : 'Yashirish',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: 'Password',
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Cols.dark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
