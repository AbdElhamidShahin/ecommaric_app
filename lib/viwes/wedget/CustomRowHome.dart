import 'package:flutter/material.dart';

import '../../view_model/commpnas/color.dart';

class Customrowhome extends StatelessWidget {
  const Customrowhome({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Popular",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
