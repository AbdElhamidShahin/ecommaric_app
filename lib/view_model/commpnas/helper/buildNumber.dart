// import 'package:flutter/material.dart';
// import '../color.dart';
//
// class QuantitySelector extends StatefulWidget {
//   final double price; // ← السعر
//   final Function(int) onChanged; // ← يحدث لما العدد يتغير
//
//   const QuantitySelector({
//     super.key,
//     required this.price,
//     required this.onChanged,
//   });
//
//   @override
//   State<QuantitySelector> createState() => _QuantitySelectorState();
// }
//
// class _QuantitySelectorState extends State<QuantitySelector> {
//   int count = 1;
//
//   void increment() {
//     setState(() => count++);
//     widget.onChanged(count);
//   }
//
//   void decrement() {
//     if (count > 1) {
//       setState(() => count--);
//       widget.onChanged(count);
//     }
//   }
//
//   Widget buildNumber(
//       int count, double horizontal, double vertical, double fontSize) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
//       decoration: const BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.transparent,
//       ),
//       child: Text(
//         "$count",
//         style: TextStyle(
//           fontSize: fontSize,
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
//
//   Widget buildButton(IconData icon, VoidCallback onPressed) {
//     return InkWell(
//       onTap: onPressed,
//       borderRadius: BorderRadius.circular(20),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 6),
//         child: Container(
//           height: 45,
//           width: 45,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             gradient: ColorTextBottom,
//           ),
//           child: Center(
//             child: Icon(
//               icon,
//               size: 32,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
// // السعر
//         Text(
//           "\$${(widget.price)}",
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.white.withOpacity(0.85),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const Spacer(),
//
// // زرار + وعدد و زرار -
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             buildButton(Icons.add, increment),
//             buildNumber(count, 16, 10, 28),
//             buildButton(Icons.remove, decrement),
//           ],
//         ),
//       ],
//     );
//   }
// }
