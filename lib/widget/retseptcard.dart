import 'package:flutter/material.dart';
import 'package:hooker_cooker/provider/retseptprovider.dart';
import 'package:provider/provider.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
// RetseptProvider joylashgan faylni import qilasiz:
// import 'retsept_provider.dart';

class Retseptcard extends StatelessWidget {
  const Retseptcard({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider'ni kuzatib boramiz
    final provider = context.watch<RetseptProvider>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'TAOM NOMI',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller:
                      provider.nameController, // Providerdagi controller
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    hintText: "Nomini kiriting",
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PORSIYA SONI',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' ${provider.porsiya} kishlik',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xFFF2F3F7),
                                    ),
                                    padding: const EdgeInsets.all(3),
                                    child: const Icon(Icons.remove, size: 20),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<RetseptProvider>()
                                        .porsiyaKamaytirish();
                                  },
                                ),
                                const SizedBox(width: 4),
                                IconButton(
                                  icon: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xFFF2F3F7),
                                    ),
                                    padding: const EdgeInsets.all(3),
                                    child: const Icon(Icons.add, size: 20),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<RetseptProvider>()
                                        .porsiyaQoShish();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(width: 1, color: Color(0xFFEEEEEE)),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'TAYYORLASH VAQTI',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time_rounded,
                              color: Color(0xFFFF5200),
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: TextField(
                                controller: provider
                                    .vaqtiController, // Providerdagi vaqt controlleri
                                keyboardType: TextInputType.number,
                                cursorColor: Cols.dark,
                                cursorWidth: 1,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: '0',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Cols.dark,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'daqida',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Cols.dark,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
