import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/model/cubit/ItemProvider.dart';


class CustomCardItem extends StatelessWidget {
  final Item item;
  final int quantity;

  const CustomCardItem({
    super.key,
    required this.item,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1F23),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // صورة المنتج
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2C2F36), Color(0xFF1A1B1D)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.broken_image,
                  color: Colors.grey.shade700,
                  size: 38,
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // تفاصيل المنتج
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  '\$${(double.parse(item.price) * quantity).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '\$${item.price} each',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),

          // أدوات التحكم
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // زر الحذف بتصميم دائري وشفاف
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.08),
                ),
                child: IconButton(
                  onPressed: () => _removeItem(context),
                  icon: const Icon(Icons.delete_outline),
                  color: Colors.white70,
                  splashRadius: 22,
                ),
              ),
              const SizedBox(height: 10),

              // وحدة التحكم بالكمية بتصميم راقي
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF2F3136),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // زر -
                    InkWell(
                      onTap: () => _updateQuantity(context, quantity - 1),
                      borderRadius: BorderRadius.circular(20),
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(Icons.remove, color: Colors.white, size: 18),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // القيمة
                    Text(
                      quantity.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    // زر +
                    InkWell(
                      onTap: () => _updateQuantity(context, quantity + 1),
                      borderRadius: BorderRadius.circular(20),
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(Icons.add, color: Colors.white, size: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    )
;
  }

  void _removeItem(BuildContext context) {
    Provider.of<ItemCard>(context, listen: false).removeCard(item);
    _showRemovalSnackbar(context);
  }

  void _updateQuantity(BuildContext context, int newQuantity) {
    if (newQuantity <= 0) return;
    Provider.of<ItemCard>(context, listen: false)
        .updateQuantity(item, newQuantity);
  }

  void _showRemovalSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey.shade900,
        content: Text(
          'Removed ${item.name}',
          style: const TextStyle(color: Colors.white),
        ),
        action: SnackBarAction(
          label: 'UNDO',
          textColor: Colors.white,
          onPressed: () {
            Provider.of<ItemCard>(context, listen: false)
                .addCard(item, quantity);
          },
        ),
      ),
    );
  }
}
