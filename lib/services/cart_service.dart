import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get count => _items.fold(0, (sum, item) => sum + item.quantity);

  double get total =>
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
    } catch (_) {}
  }

  void removeItem(String name) {
    _items.removeWhere((e) => e.name == name);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
