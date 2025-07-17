import 'package:food_app/model/cubit/item.dart';

abstract class AppState {}

class AppInitialState  extends AppState {}

class TravelBottomnavBarState extends AppState {}

class CategoryLoadingState extends AppState {}

class CategorySuccess extends AppState {
  final List<Item> items;

  CategorySuccess({required this.items});
}

class CategoryLoaded extends AppState {
  final List<Item> items;
  final String tableName;
  final String uniqueId;

  CategoryLoaded(this.items, this.tableName, {required this.uniqueId});
}

class CategoryError extends AppState {
  final String message;

  CategoryError(this.message);
}

class updateFavoriteState extends AppState {
  final bool isFavorite;
  updateFavoriteState(this.isFavorite);
}

class FoodCountState extends AppState {
  final int count;
  FoodCountState(this.count);
}

class CategoryInitial extends AppState {}
class AppChangeTabState extends AppState {}
