import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:food_app/view_model/commpnas/color.dart';

import '../../model/cubit/cubit/bloc.dart';
import '../../model/cubit/cubit/states.dart';
import 'Account_Screen.dart';
import 'Favorite_Screen.dart';
import 'Home_Layout.dart';
import 'cardScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  void changeTab(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final cubit = AppCubit.get(context);
        final screenWidth = MediaQuery
            .of(context)
            .size
            .width;
        final iconWidth = screenWidth / cubit.activeIcons.length;

        return Scaffold( // <-- رجعت الـ Scaffold
          body: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: cubit.bottomScreens,
          ),
          bottomNavigationBar: SizedBox(
            height: 100,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: screenWidth,
                    height: 100,
                    color: bottomBar,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: iconWidth * currentIndex + iconWidth / 2 - 49,
                  child: CustomPaint(
                    size: const Size(100, 45),
                    painter: NotchPainter(),
                  ),
                ),
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(cubit.activeIcons.length, (index) {
                      final isSelected = currentIndex == index;
                      final iconPath = isSelected
                          ? cubit.activeIcons[index]
                          : cubit.inactiveIcons[index];

                      return GestureDetector(
                        onTap: () => changeTab(index),
                        child: Container(
                          alignment: Alignment.center,
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color(0xFF818285),
                                  Color(0xFFF3F3F4),
                                ],
                                stops: [0.0, 0.8],
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.srcIn,
                            child: SvgPicture.asset(
                              iconPath,
                              width: 32,
                              height: 32,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NotchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final Gradient gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF818285),
        Color(0xFFECECEC),
      ],
      stops: [0.0, 0.5],
    );

    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, 0);
    path.close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.2), 4, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
