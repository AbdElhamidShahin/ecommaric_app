import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/cubit/ItemProvider.dart';
import '../../model/cubit/item.dart';
import '../../view_model/commpnas/color.dart';

class CustomTextButton extends StatefulWidget {
  final Item item;
  final double horizontal;
  final double fontSize;
  final double vertical;  final int quantity; // ← أضف هذا السطر

  const CustomTextButton({
    super.key,
    required this.item,
    required this.horizontal,
    required this.vertical,
    required this.fontSize,  this.quantity =1,
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  late bool isCard;
  int count = 1;

  @override
  void initState() {
    super.initState();
    isCard = Provider.of<ItemProvider>(context, listen: false)
        .items
        .any((element) => element.id == widget.item.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: ColorTextBottom,
        borderRadius: BorderRadius.circular(
            20), // Added borderRadius here to match the button
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Colors.transparent, // Make button background transparent
          shadowColor: Colors.transparent, // Remove shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: widget.horizontal, vertical: widget.vertical),
        ),
        onPressed: () {
          Provider.of<ItemCard>(context, listen: false)
              .addCard(widget.item, widget.quantity); // ← استخدم الكمية الصح

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
              duration: const Duration(seconds: 2),
              content: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.white, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'تمت إضافة المنتج إلى السلة!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

        },

        child: Center(
          child: Text(
            "Add to bag",
            style: TextStyle(
              color: Colors.white.withOpacity(.8),
              fontWeight: FontWeight.w600,
              fontSize: widget.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
