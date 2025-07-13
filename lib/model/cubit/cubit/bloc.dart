import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/model/cubit/cubit/states.dart';
import 'package:food_app/viwes/screens/Account_Screen.dart';
import 'package:food_app/viwes/screens/cardScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:food_app/model/cubit/item.dart';
import '../../../viwes/screens/CatogaryScreen.dart';
import '../../../viwes/screens/Favorite_Screen.dart';
import '../../../viwes/screens/Home_Layout.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super((TravelInitialState()));

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  Future<void> fetchCategoryData(String tableName, {String? uniqueId}) async {
    try {
      emit(CategoryLoadingState());

      final response = await Supabase.instance.client
          .from(tableName)
          .select('id, name, price, imageUrl, rating, description');

      if (response.isEmpty) {
        emit(CategoryError('No data found for table "$tableName".'));
        return;
      }

      final List<Item> items = response
          .map((item) => Item(
                id: item['id']?.toString() ?? '0',
                name: item['name'] ?? 'No Name',
                price: item['price']?.toString() ?? '0',
                imageUrl: item['imageUrl'] ?? '',
                rating: item['rating'] ?? '',
                description: item['description'] ?? '',
              ))
          .toList();

      emit(CategoryLoaded(items, tableName, uniqueId: uniqueId ?? 'default'));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  void getCategories() {
    emit(CategoryLoadingState());
    try {
      List<Item> items = [];
      emit(CategorySuccess(items: items));
    } catch (e) {
      emit(CategoryError("حدث خطأ أثناء تحميل الفئات"));
    }
  }

  bool isFavorite = true;
  void updateFavorite(bool isFavorite) {
    this.isFavorite = isFavorite;
    emit(updateFavoriteState(isFavorite));
  }

  void increment() {
    if (state is FoodCountState) {
      final currentState = state as FoodCountState;
      emit(FoodCountState(currentState.count + 1));
    }
  }

  void decrement() {
    if (state is FoodCountState) {
      final currentState = state as FoodCountState;
      if (currentState.count > 1) {
        emit(FoodCountState(currentState.count - 1));
      }
    }
  }
}
