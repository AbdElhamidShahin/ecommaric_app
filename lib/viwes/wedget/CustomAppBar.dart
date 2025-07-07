import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/helper/LocalStorageAccount.dart';

import '../../view_model/commpnas/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 28,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
