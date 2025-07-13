import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:food_app/model/cubit/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];

  ItemProvider() {
    _loadItems();
  }

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    _saveItems();
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    _saveItems();
    notifyListeners();
  }

  void _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(_items.map((item) => item.toJson()).toList());
    await prefs.setString('favorite_items', data);
  }

  void _loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('favorite_items');
    if (data != null) {
      final List<dynamic> json = jsonDecode(data);
      _items = json.map((e) => Item.fromJson(e)).toList();
      notifyListeners();
    }
  }
}

class ItemCard with ChangeNotifier {
  List<Item> _items = [];
  Map<String, int> _itemQuantities = {};

  List<Item> get items => _items;

  void addCard(Item item, int quantity) {
    _items.add(item);
    _itemQuantities[item.id] = quantity; // 👈 أضف هذا السطر
    _saveCard();
    notifyListeners();
  }
  void updateQuantity(Item item, int newQuantity) {
    if (_itemQuantities.containsKey(item.id)) {
      _itemQuantities[item.id] = newQuantity;
      _saveCard();
      notifyListeners();
    }
  }
  void removeCard(Item item) {
    _items.removeWhere((element) => element.id == item.id);
    _itemQuantities.remove(item.id);
    _saveCard();
    notifyListeners();
  }

  int getQuantity(Item item) {
    return _itemQuantities[item.id] ?? 1;
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in _items) {
      total += double.parse(item.price) * _itemQuantities[item.id]!;
    }
    return total;
  }

  void _saveCard() async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode({
      'items': _items.map((item) => item.toJson()).toList(),
      'quantities': _itemQuantities,
    });
    await prefs.setString('Card_items', data);
  }
  Future<void> loadCard() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('Card_items');

    if (data != null) {
      final decoded = jsonDecode(data);
      final List<dynamic> itemsJson = decoded['items'];
      _items = itemsJson.map((e) => Item.fromJson(e)).toList();

      final Map<String, dynamic> quantities = Map<String, dynamic>.from(decoded['quantities']);
      _itemQuantities = quantities.map((key, value) => MapEntry(key, value as int));

      notifyListeners();
    }
  }


}
