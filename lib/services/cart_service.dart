import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // ✅ THIS WAS MISSING — count getter
  int get count => _items.length;

  // ✅ total amount
  double get totalAmount {
    double total = 0;
    for (var item in _items) {
      total += item.price;
    }
    return total;
  }

  // ✅ add item
  void addItem(String name, double price) {
    _items.add(CartItem(name: name, price: price));
    notifyListeners();
  }

  // ✅ remove item
  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  // ✅ clear cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
