import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';

import '../../view_model/commpnas/color.dart';

class Customcarditem extends StatelessWidget {
  final Item item;
  final int quantity;

  const Customcarditem({
    super.key,
    required this.item,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // صورة المنتج
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 80,
                height: 80,
                color: Colors.grey[200],
                child: const Icon(Icons.fastfood),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // التفاصيل
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  '${(double.parse(item.price) * quantity).toStringAsFixed(2)} EGP',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            ),
          ),

          // التعديل و الحذف
          Column(
            children: [
              IconButton(
                onPressed: () {
                  Provider.of<ItemCard>(context, listen: false)
                      .removeCard(item);
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
              QuantitySelector(
                price: double.parse(item.price),
                quantity: quantity, // القيمة المبدئية
                onChanged: (newCount) {
                  Provider.of<ItemCard>(context, listen: false).updateQuantity(item, newCount);
                },
              ),

            ],
          ),
        ],
      ),
    );
  }
}


class QuantitySelector extends StatefulWidget {
  final double price;
  final int quantity;
  final ValueChanged<int> onChanged;

  const QuantitySelector({
    super.key,
    required this.price,
    required this.quantity,
    required this.onChanged,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.quantity;
  }

  void increment() {
    setState(() {
      count++;
    });
    widget.onChanged(count);
  }

  void decrement() {
    if (count > 1) {
      setState(() {
        count--;
      });
      widget.onChanged(count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // زر -
        InkWell(
          onTap: count > 1 ? decrement : null,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: count > 1
                  ? ColorTextBottom
                  : LinearGradient(colors: [Colors.grey, Colors.grey.shade400]),
            ),
            child: const Icon(Icons.remove, size: 28, color: Colors.white),
          ),
        ),

        // العدد
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '$count',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),

        // زر +
        InkWell(
          onTap: increment,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: ColorTextBottom,
            ),
            child: const Icon(Icons.add, size: 28, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
