import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/cubit/cubit/bloc.dart';
import '../../model/cubit/cubit/states.dart';
import '../../viwes/wedget/CustomCatogryItem.dart';
import '../../viwes/wedget/TheBesrCatogary.dart';

class Pushitemcatogry extends StatelessWidget {
  final String tableName;
  final String uniqueId;
  final double height; // Add height parameter

  const Pushitemcatogry({
    super.key,
    required this.tableName,
    required this.uniqueId,
    this.height = 200, // Default height
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, // Constrain the height
      child: BlocProvider(
        create: (context) =>
        FoodCubit()..fetchCategoryData(tableName, uniqueId: uniqueId),
        child: BlocBuilder<FoodCubit, FoodState>(
          builder: (context, state) {
            if (state is CategoryLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryError) {
              return Center(child: Text(state.message));
            } else if (state is CategoryLoaded) {
              if (state.tableName == tableName && state.uniqueId == uniqueId) {
                final items = state.items;
                if (items.isEmpty) {
                  return const Center(child: Text('لا توجد عناصر متاحة'));
                }

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TheBesrCatogary(item: item),
                    );
                  },
                );
              }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}