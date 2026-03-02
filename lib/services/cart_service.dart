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

  // ✅ TOTAL ITEMS COUNT
  int get totalItems =>
      _items.fold(0, (sum, item) => sum + item.quantity);

  // ✅ TOTAL PRICE
  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  // 🔥 IMPORTANT: THIS IS THE METHOD HOME SCREEN NEEDS
  void addItem(String name, double price) {
    try {
      final index = _items.indexWhere((item) => item.name == name);

      if (index != -1) {
        _items[index].quantity++;
      } else {
        _items.add(
          CartItem(name: name, price: price),
        );
      }

      notifyListeners();
    } catch (e) {
      debugPrint('Cart addItem error: $e');
    }
  }

  // ✅ REMOVE ITEM
  void removeItem(String name) {
    _items.removeWhere((item) => item.name == name);
    notifyListeners();
  }

  // ✅ CLEAR CART
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
