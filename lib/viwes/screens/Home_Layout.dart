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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: appBackgroundGradient,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Pushitemcatogry(
                tableName: 'camira',
                uniqueId: '1',
                height: 300, // You can customize the height
              )
            ),
            const Customrowhome(),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Pushitemcatogryhome(
                    tableName: 'camira',
                    uniqueId: '1',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}