import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';

class Customcard extends StatelessWidget {
  final Widget widget;
  final String title;
  final String subtitle;
  final Color rang;
  final Widget icon;
  const Customcard({
    super.key,
    required this.widget,
    required this.title,
    required this.subtitle, required this.rang, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: rang,
                ),
                child: Transform.scale(
                  scale: 0.5,
                  child: icon,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              Spacer(),
              widget,
            ],
          ),
          Divider(height: 1, color: Cols.canvas),
        ],
      ),
    );
  }
}
