import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:food_app/view_model/commpnas/color.dart';
import 'package:food_app/view_model/commpnas/helper/buildNumber.dart';
import 'package:food_app/viwes/wedget/buildFavoriteIcon.dart';
import 'package:provider/provider.dart';

import '../../model/cubit/ItemProvider.dart';

class CustomDetailsScreen extends StatefulWidget {
  final Item item;

  CustomDetailsScreen({super.key, required this.item});

  @override
  State<CustomDetailsScreen> createState() => _CustomDetailsScreenState();
}

class _CustomDetailsScreenState extends State<CustomDetailsScreen> {
  late bool isCard;
  int count = 1;

  @override
  void initState() {
    super.initState();
    isCard = Provider.of<ItemProvider>(context, listen: false)
        .items
        .any((element) => element.id == widget.item.id);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: CustomdetailsUpper,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                bottom: 550,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(16)),
                  child: Image.network(
                    widget.item.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/imagesFood/download.png',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                top: MediaQuery.of(context).size.height /
                    2, // ← يبدأ من منتصف الشاشة
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: ColorBest,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.name,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white
                              .withOpacity(0.85), // ← أفتح من white70
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            "\$${(widget.item.price)}",
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white
                                  .withOpacity(0.85), // ← أفتح من white70
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              buildButton(Icons.add, () {
                                setState(() {
                                  count++;
                                });
                              }),
                              buildNumber(count, 16, 10,
                                  28), // ← ضبط حجم الخط حسب الحاجة
                              buildButton(Icons.remove, () {
                                setState(() {
                                  if (count > 1) count--;
                                });
                              }),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_purple500_outlined,
                            size: 28,
                            color: Colors.orangeAccent,
                          ),
                          Text(
                            "${widget.item.rating}",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Text(
                            "(500 reviews)",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.item.description}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), SizedBox(height: 12,),
                      Row(
mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                         BuildFavoriteIcon(
                            item: widget.item,
                          ),
                          Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              gradient: ColorTextBottom,
                              borderRadius: BorderRadius.circular(
                                  20), // Added borderRadius here to match the button
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .transparent, // Make button background transparent
                                shadowColor:
                                    Colors.transparent, // Remove shadow
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 48,vertical: 18),
                              ),
                              onPressed: () {
                                Provider.of<ItemCard>(context, listen: false)
                                    .addCard(widget.item, count);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('تمت إضافة المنتج إلى السلة!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                              child: Center(
                                child: Text(
                                  "Add to bag",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(.8),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap:
                      (){
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Container(
                          height: 45,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: ColorTextBottom,
                          ),
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
