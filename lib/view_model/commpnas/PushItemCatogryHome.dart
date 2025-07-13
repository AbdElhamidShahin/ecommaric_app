import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/viwes/wedget/CustomImageHome.dart';
import '../../model/cubit/cubit/bloc.dart';
import '../../model/cubit/cubit/states.dart';

class Pushitemcatogryhome extends StatelessWidget {
  final String tableName;
  final String uniqueId;

  const Pushitemcatogryhome(
      {super.key, required this.tableName, required this.uniqueId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      AppCubit()..fetchCategoryData(tableName, uniqueId: uniqueId),
      child: BlocBuilder<AppCubit, AppState>(
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

              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                ), // padding متساوي يمين وشمال
                child: Wrap(
                  spacing: 16,
                  runSpacing: 24,
                  children: List.generate(items.length, (index) {
                    final item = items[index];
                    return SizedBox(
                      width: (MediaQuery.of(context).size.width - 48) / 2, // حسب الشاشة
                      child: CustomImageHome(item: item),
                    );
                  }),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
