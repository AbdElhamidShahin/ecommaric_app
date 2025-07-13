import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';
import 'package:food_app/viwes/wedget/customCardItem.dart';

class Cardscreen extends StatelessWidget {
  const Cardscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemCard = Provider.of<ItemCard>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('السلة'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: itemCard.items.isEmpty
                ? const Center(
              child: Text(
                'السلة فارغة!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: itemCard.items.length,
              itemBuilder: (context, index) {
                final item = itemCard.items[index];
                final quantity = itemCard.getQuantity(item);
                return Customcarditem(item: item, quantity: quantity);
              },
            ),
          ),

          // قسم المجموع و زر الطلب
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('المجموع:', style: TextStyle(fontSize: 18)),
                    Text('${itemCard.getTotalPrice().toStringAsFixed(2)} EGP',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('تم إرسال الطلب!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.deepOrange,
                    ),
                    child: const Text(
                      'اتمام الطلب',
                      style: TextStyle(fontSize: 18),
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
