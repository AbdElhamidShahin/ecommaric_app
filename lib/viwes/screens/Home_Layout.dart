import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/view_model/commpnas/PushItemCatogry.dart';
import 'package:food_app/viwes/wedget/CustomAppBar.dart';

import '../../view_model/commpnas/PushItemCatogryHome.dart';
import '../../view_model/commpnas/color.dart';
import '../wedget/CustomRowHome.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: appBackgroundGradient,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Customrowhome(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: Pushitemcatogryhome(
                  tableName: 'camira',
                  uniqueId: '1',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
