import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get count => _items.length;

  double get totalAmount {
    double total = 0;
    for (var item in _items) {
      total += item.price * item.quantity;
    }
    return total;
  }

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

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
