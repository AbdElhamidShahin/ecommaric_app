import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/cubit/ItemProvider.dart';
import '../wedget/FavoriteProductCard.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteItems = Provider.of<ItemProvider>(context).items;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF24262B), // رمادي غامق
              Color(0xFF1C1C1E), // أسود تقريبًا
            ],
            stops: [.0, .6],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // AppBar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Text(
                    'Favorite',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Content
              Expanded(
                child: favoriteItems.isEmpty
                    ? const Center(
                        child: Text(
                          '🖤 There are no favorite products yet.',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.builder(
                          itemCount: favoriteItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.64,
                          ),
                          itemBuilder: (context, index) => FavoriteProductCard(
                            item: favoriteItems[index],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
