import 'package:flutter/material.dart';
import 'package:hooker_cooker/provider/retseptprovider.dart';
import 'package:provider/provider.dart';

class RetseptScreen extends StatefulWidget {
  const RetseptScreen({super.key});

  @override
  State<RetseptScreen> createState() => _RetseptScreenState();
}

class _RetseptScreenState extends State<RetseptScreen> {
  @override
  void initState() {
    super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Provider.of<RetseptProvider>(context, listen: false).fetchIngredients();
  });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RetseptProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Retsept Masalliqilari"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: provider.nameController,
              decoration: const InputDecoration(
                labelText: "Masalliq nomi (masalan: Un)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: provider.amountController,
              decoration: const InputDecoration(
                labelText: "Mog'dori (masalan: 200g)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => provider.masalliqQoshish(),
              child: const Text("Masalliq qo'shish"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: provider.ingredients.isEmpty
                  ? const Center(child: Text("Hozircha masalliqlar yo'q"))
                  : ListView.builder(
                      itemCount: provider.ingredients.length,
                      itemBuilder: (context, index) {
                        final item = provider.ingredients[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            title: Text(item.name),
                            subtitle: Text(item.amount),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                if (item.id != null) {
                                  provider.masalliqOchirish(item.id!);
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}