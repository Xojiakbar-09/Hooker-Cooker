import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';

class Masaliqlartab extends StatefulWidget {
  final dynamic model;
  const Masaliqlartab({super.key, required this.model});

  @override
  State<Masaliqlartab> createState() => _MasalliqlarTabViewState();
}

class _MasalliqlarTabViewState extends State<Masaliqlartab> {
  int _selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
    final List masalliqlarList = widget.model?.masalliqlar ?? [];
    final List qadamlarList = widget.model?.qadamlar ?? [];

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFEBECEF),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Expanded(
                child: _buildTabButton(
                  title: "Masalliqlar (${masalliqlarList.length})",
                  index: 0,
                ),
              ),
              Expanded(
                child: _buildTabButton(
                  title: "Qadamlar (${qadamlarList.length})",
                  index: 1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        _selectedIndex == 0
            ? _buildIngredientsCard(masalliqlarList)
            : _buildStepsCard(qadamlarList),
      ],
    );
  }

  Widget _buildTabButton({required String title, required int index}) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? Colors.black87 : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }

  // Masalliqlar ro'yxati kartochkasi (TUZATILGAN QISMI)
  Widget _buildIngredientsCard(List items) {
    if (items.isEmpty) {
      return const Center(child: Text("Masalliqlar kiritilmagan"));
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      // Material vidjeti qo'shildi — bu ListTile splash va fon muammosini hal qiladi
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (context, index) => Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
            color: Colors.grey.shade100,
          ),
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              onTap: () {
                setState(() {
                  item.isChecked = !item.isChecked;
                });
              },
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              leading: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.isChecked ? Cols.primery : Colors.transparent,
                  border: item.isChecked
                      ? null
                      : Border.all(color: Colors.grey.shade400, width: 2),
                ),
                child: item.isChecked
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : null,
              ),
              title: Text(
                item.nomi,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              subtitle: Text(
                item.izoh,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
              trailing: Text(
                item.miqdori,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStepsCard(List steps) {
    if (steps.isEmpty) {
      return const Center(child: Text("Qadamlar kiritilmagan"));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: steps.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all( 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Cols.primery,
                  child: Text(
                    "${index + 1}",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    steps[index],
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}