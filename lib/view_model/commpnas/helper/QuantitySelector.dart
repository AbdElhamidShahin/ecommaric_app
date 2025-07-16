import 'package:flutter/material.dart';

import '../color.dart';

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
                gradient: ColorTextBottom),
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
