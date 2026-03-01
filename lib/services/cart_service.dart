import 'package:flutter/material.dart';

class CartService extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addItem({required String name, required double price}) {
    _items.add({
      'name': name,
      'price': price,
    });
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  double get total =>
      _items.fold(0, (sum, item) => sum + (item['price'] as double));

  int get count => _items.length;
}
