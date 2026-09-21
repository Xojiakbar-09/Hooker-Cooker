import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';

class IngredientItem {
  String name;
  String amount;
  IngredientItem({required this.name, required this.amount});
}

class MasalliqlarCard extends StatefulWidget {
  const MasalliqlarCard({super.key});

  @override
  State<MasalliqlarCard> createState() => _MasalliqlarCardState();
}

class _MasalliqlarCardState extends State<MasalliqlarCard> {
  // Controllerlar qo'shildi
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  List<IngredientItem> ingredients = [
    IngredientItem(name: "Shampinyon qo'ziqorini", amount: "400 gr"),
    IngredientItem(name: "30% li maxsus qaymoq", amount: "200 ml"),
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                itemCount: ingredients.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  color: Color(0xFFEEEEEE),
                  indent: 16,
                  endIndent: 16,
                ),
                itemBuilder: (context, index) {
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
                            ingredients[index].name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Text(
                          ingredients[index].amount,
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
                          controller: _nameController, // Kontroller ulandi
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
                          controller: _amountController, // Kontroller ulandi
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
                // Ma'lumot kiritilganini tekshirib, ro'yxatga qo'shish
                if (_nameController.text.trim().isNotEmpty &&
                    _amountController.text.trim().isNotEmpty) {
                  setState(() {
                    ingredients.add(
                      IngredientItem(
                        name: _nameController.text.trim(),
                        amount: _amountController.text.trim(),
                      ),
                    );
                    _nameController.clear();
                    _amountController.clear();
                  });
                }
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