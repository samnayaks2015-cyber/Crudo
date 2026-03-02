import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalItems =>
      _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void addItem(String name, double price) {
    try {
      final index = _items.indexWhere((e) => e.name == name);

      if (index >= 0) {
        _items[index].quantity++;
      } else {
        _items.add(CartItem(name: name, price: price));
      }

      notifyListeners();
    } catch (e) {
      debugPrint("Cart error: $e");
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
