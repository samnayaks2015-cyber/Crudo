import 'package:flutter/material.dart';

class CartItemModel {
  final String name;
  final double price;

  CartItemModel({
    required this.name,
    required this.price,
  });
}

class CartService extends ChangeNotifier {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => _items;

  int get count => _items.length;

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.price);

  void addItem(CartItemModel item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
