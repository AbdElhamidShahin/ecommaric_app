import 'package:flutter/material.dart';
import '../color.dart';

int count = 1;

Widget buildNumber(int count, double horizontal, double vertical, double fontSize) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.transparent, // ← أضف خلفية لو حبيت
    ),
    child: Text(
      "$count",
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildButton(IconData icon, VoidCallback onPressed) {
  return InkWell(
    onTap: onPressed,
    borderRadius: BorderRadius.circular(20),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: ColorTextBottom,
        ),
        child: Center(
          child: Icon(
            icon,
            size: 32,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
