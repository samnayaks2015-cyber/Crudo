import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // ➕ add item
  void addItem(String name, double price) {
    final index = _items.indexWhere((e) => e.name == name);

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(
        CartItem(
          name: name,
          price: price,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  // ❌ remove item
  void removeItem(String name) {
    _items.removeWhere((e) => e.name == name);
    notifyListeners();
  }

  // 🔢 total count
  int get itemCount {
    int count = 0;
    for (var item in _items) {
      count += item.quantity;
    }
    return count;
  }

  // 💰 total amount
  double get totalAmount {
    double total = 0;
    for (var item in _items) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
