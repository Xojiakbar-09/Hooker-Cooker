import 'package:flutter/material.dart';

void showErrorTopSnackBar(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF1E232D), // To'q fon
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFFF3B30).withAlpha(100), // Qizil chegara
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF3B30).withAlpha(40), // Qizil glow
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // 1. Xatolik ikonkasi (Qizil fonda)
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF3B30).withAlpha(38),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.error_outline_rounded, // Yoki Icons.cancel_rounded
                  color: Color(0xFFFF3B30),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),

              // 2. Xatolik xabari matni
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              const SizedBox(width: 8),

            ],
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // 3 soniyadan keyin avtomatik yopilish
  Future.delayed(const Duration(seconds: 3), () {
    if (overlayEntry.mounted) {
      overlayEntry.remove();
    }
  });
}