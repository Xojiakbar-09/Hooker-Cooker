import 'package:flutter/material.dart';
import 'package:hooker_cooker/provider/retseptprovider.dart';
import 'package:provider/provider.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
// RetseptProvider joylashgan faylni import qilasiz:
// import 'retsept_provider.dart';

class MasalliqlarCard extends StatelessWidget {
  const MasalliqlarCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RetseptProvider>();

    return Column(
      children: [
        Container(
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
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.ingredients.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  color: Color(0xFFEEEEEE),
                  indent: 16,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
                  final item = provider.ingredients[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF5200),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Text(
                          item.amount,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const Divider(height: 1, color: Color(0xFFEEEEEE)),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: provider.nameController,
                          keyboardType: TextInputType.name,
                          cursorColor: Cols.dark,
                          cursorWidth: 1,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            prefixIcon: Transform.scale(
                              scale: 0.5,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFF5200),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Masalliq kiritish',
                            hintStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),

                      const VerticalDivider(
                        width: 20,
                        thickness: 1,
                        color: Colors.grey,
                      ),

                      Expanded(
                        child: TextField(
                          controller: provider.amountController,
                          keyboardType: TextInputType.text,
                          cursorColor: Cols.dark,
                          cursorWidth: 1,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            prefixIcon: Transform.scale(
                              scale: 0.5,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFF5200),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Qancha qo\'shmoqchisiz',
                            hintStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                provider.masalliqQoshish();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Cols.primery,
                foregroundColor: Cols.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Massaliqni qoshish',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}