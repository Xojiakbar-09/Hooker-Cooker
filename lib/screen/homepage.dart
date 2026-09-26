import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hooker_cooker/consts/colors/appcolor.dart';
import 'package:hooker_cooker/provider/homeprovider.dart'; 
import 'package:hooker_cooker/widget/customgridview.dart';
import 'package:hooker_cooker/widget/customsearch.dart';
import 'package:hooker_cooker/widget/homeappbar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Scaffold(
      backgroundColor: Cols.canvas,
      appBar: const Homeappbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Customsearch(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(
              height: 45,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: provider.filter.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.read<HomeProvider>().changeFilter(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: provider.filterIndex == index
                          ? Cols.dark
                          : Cols.white,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Center(
                      child: Text(
                        provider.filter[index],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: provider.filterIndex == index
                              ? Cols.white
                              : Cols.dark,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Customgridview(key: UniqueKey()),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
