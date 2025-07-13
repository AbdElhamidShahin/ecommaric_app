import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:food_app/model/cubit/item.dart' show Item, ItemProvider;
import 'package:provider/provider.dart';
import '../../model/cubit/ItemProvider.dart';
import '../../view_model/commpnas/color.dart';

class BuildFavoriteIcon extends StatefulWidget {
  final Item item;
  Color? color;
  BuildFavoriteIcon({Key? key, required this.item}) : super(key: key);

  @override
  State<BuildFavoriteIcon> createState() => _BuildFavoriteIconState();
}

class _BuildFavoriteIconState extends State<BuildFavoriteIcon> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = Provider.of<ItemProvider>(context, listen: false)
        .items
        .contains(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          gradient: ColorItemFavorite,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
                Provider.of<ItemProvider>(context, listen: false)
                    .addItem(widget.item);
              });
            },
            icon: ShaderMask(
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
                isFavorite
                    ? 'assets/icons/bookmark1.svg'
                    : 'assets/icons/bookmark.svg',
                height: 28,
                width: 28,
                // ❌ لا تستخدم color هنا لأنه فيه ShaderMask
              ),
            ),
          ),
        ),
      ),
    );
  }
}
