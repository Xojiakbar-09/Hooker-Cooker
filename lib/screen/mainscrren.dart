import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/screen/homepage.dart';
import 'package:hooker_cooker/screen/kolleksiya.dart';
import 'package:hooker_cooker/screen/profile.dart';
import 'package:hooker_cooker/screen/retsept.dart';
import 'package:hooker_cooker/screen/saqlangan.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Homepage(),
      Kolleksiya(),
      const Saqlangan(),
      const Profile()
    ];

    return Scaffold(
      extendBody: true,

      body: pages[_currentIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SizedBox(
          height: 70,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.4),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      index: 0,
                      icon: Icons.menu_book_rounded,
                      label: 'Retseptlar',
                    ),
                    _buildNavItem(
                      index: 1,
                      icon: Icons.grid_view_rounded,
                      label: 'Kolleksiya',
                    ),

                    _buildAddButton(),

                    _buildNavItem(
                      index: 2,
                      icon: Icons.bookmark_rounded,
                      label: 'Saqlangan',
                    ),
                    _buildNavItem(
                      index: 3,
                      icon: Icons.person_rounded,
                      label: 'Profil',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final isSelected = _currentIndex == index;
    final activeColor = Cols.primery;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? activeColor : Colors.black54,
              size: 24,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? activeColor : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Retsept()),
        );
      },
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: Cols.primery,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Cols.primery.withValues(alpha: 0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 26),
      ),
    );
  }
}
