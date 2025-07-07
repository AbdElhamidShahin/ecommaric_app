import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/cubit/item.dart';
import '../../view_model/commpnas/color.dart';
import '../screens/CustomDetailsScreen.dart';

class TheBesrCatogary extends StatelessWidget {
  final Item item;

  TheBesrCatogary({super.key, required this.item,});

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
                gradient: ColorItem,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star_purple500_outlined,
                        size: 20,
                        color: Colors.orangeAccent,
                      ),
                      Text(
                        item.rating,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                  Image.network(
                    item.imageUrl,
                    height: 130,
                    width: 210,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      item.name,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          '\$${item.price}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: ColorItem,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white70,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
