import 'package:flutter/material.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/widget/customimage.dart';
import 'package:hooker_cooker/widget/masalliq.dart';
import 'package:hooker_cooker/widget/retsepapbar.dart';
import 'package:hooker_cooker/widget/retseptcard.dart';
import 'package:hooker_cooker/widget/step.dart';
import 'package:hooker_cooker/widget/stepqoshish.dart';

class Retsept extends StatefulWidget {
  const Retsept({super.key});

  @override
  State<Retsept> createState() => _RetseptState();
}

class _RetseptState extends State<Retsept> {
  final TextEditingController _noteController = TextEditingController();

  List<String> steps = [
    "Qo'ziqorinlarni yupqa tilim qilib to'g'rang va sariyog'da qovuring.",
  ];

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cols.canvas,
      appBar: AddRecipeAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: CustomImage(),
              ),
              Retseptcard(),
              SizedBox(height: 15),
              Text(
                "MASALLIQLAR RO'YXATI",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8),
              MasalliqlarCard(),
              SizedBox(height: 15),

              Text(
                "QADAMLAR (TAYYORLASH)",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8),

              Stepqoshish(
                cantroller: _noteController,
                onAdd: (newStep) {
                  setState(() {
                    steps.add(newStep); 
                  });
                },
              ),
              SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Stepcard(
                      stepNumber: index + 1,
                      stepText: steps[index],
                    ),
                  );
                },
              ),

              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
