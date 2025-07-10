import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/PushItemCatogry.dart';
import 'package:food_app/viwes/wedget/CustomAppBar.dart';

import '../../model/cubit/item.dart';
import '../../view_model/commpnas/PushItemCatogryHome.dart';
import '../../view_model/commpnas/color.dart';
import '../wedget/CustomRowHome.dart';
import '../wedget/TheBesrCatogary.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: appBackgroundGradient,
      ),
       child:   Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: Customappbar(
                text: "PixelCo.",
              ),
            ),

            Expanded(
              flex: 3,
              child: Pushitemcatogry(
                tableName: 'camira',
                uniqueId: '1',
              ),
            ),

            SizedBox(height: 24),

            // ✅ هنا التصحيح، شيلت الـ ;
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Popular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox( height: 16,),
            Expanded(
              flex: 5,
              child: Pushitemcatogryhome(
                tableName: 'camira',
                uniqueId: '1',
              ),
            ),
          ],
        ),

    );
  }
}
