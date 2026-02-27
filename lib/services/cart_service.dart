import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get count => _items.length;

  double get totalPrice =>
      _items.fold(0.0, (sum, item) => sum + item.price);

  void addItem(String name, double price) {
    _items.add(CartItem(name: name, price: price));
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
