import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/provider/retseptprovider.dart';
import 'package:hooker_cooker/widget/customimage.dart';
import 'package:hooker_cooker/widget/masalliq.dart';
import 'package:hooker_cooker/widget/retsepapbar.dart';
import 'package:hooker_cooker/widget/retseptcard.dart';
import 'package:hooker_cooker/widget/step.dart';
import 'package:hooker_cooker/widget/stepqoshish.dart';
import 'package:provider/provider.dart';

class Retsept extends StatefulWidget {
  const Retsept({super.key});

  @override
  State<Retsept> createState() => _RetseptState();
}

class _RetseptState extends State<Retsept> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RetseptProvider>().clearForm();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RetseptProvider>();

    return Scaffold(
      backgroundColor: Cols.canvas,
      appBar: const AddRecipeAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: CustomImage(
                  selectedImage: provider.selectedImage,
                  onPickImage: (source) => provider.pickImage(source),
                  onRemoveImage: () => provider.removeImage(),
                ),
              ),
              const Retseptcard(),
              const SizedBox(height: 15),
              const Text(
                "MASALLIQLAR RO'YXATI",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              const MasalliqlarCard(),
              const SizedBox(height: 15),

              const Text(
                "QADAMLAR (TAYYORLASH)",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),

              // Controller ulandi va sintaktik xato to'g'rilandi
              Stepqoshish(
                controller: provider.stepController,
                onAdd: (newStep) {
                  provider.stepQoshish(newStep);
                },
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.steps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Stepcard(
                      stepNumber: index + 1,
                      stepText: provider.steps[index],
                    ),
                  );
                },
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
