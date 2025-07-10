import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/cubit/item.dart';
import '../../view_model/commpnas/color.dart';
import '../screens/CustomDetailsScreen.dart';

class TheBesrCatogary extends StatelessWidget {
  final Item item;

  TheBesrCatogary({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        closedColor: Colors.transparent,
        closedElevation: 0.0,
        openElevation: 0.0,
        transitionDuration: const Duration(milliseconds: 800),
        openBuilder: (context, _) => CustomDetailsScreen(item: item),
        closedBuilder: (context, openContainer) {
          return GestureDetector(
            onTap: openContainer,
            child: Container(
              decoration: const BoxDecoration(
                gradient: ColorBest,
              ),
           child:
           Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded( // <-- هذا هو المفتاح
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        const SizedBox(height: 26),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: ColorBestCountinar,
                              color: Colors.black.withOpacity(0.9)

                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                              child: Text(
                                'Explore now',
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Image.network(
                      item.imageUrl,
                      width: 160, // قللتها عشان توسع للنص
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
