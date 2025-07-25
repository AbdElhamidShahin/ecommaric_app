import 'package:flutter/material.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:food_app/viwes/screens/CustomDetailsScreen.dart';

import '../../view_model/commpnas/helper/FadeSlidePageRoute.dart';


class CustomImageHome extends StatelessWidget {
  const CustomImageHome({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            SlowHeroRoute(
              builder: (_) => CustomDetailsScreen(item: item),
            ),
          );

        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: ColorItem,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
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
              Hero(
                tag: 'itemImage-${item.id}', // لازم tag يكون unique
                child: Image.network(
                  item.imageUrl,
                  height: 130,
                  width: 210,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 24),
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
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
