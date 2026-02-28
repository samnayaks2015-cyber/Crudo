import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get count => _items.fold(0, (sum, item) => sum + item.quantity);

  double get total => _items.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );

  void addItem({required String name, required double price}) {
    final index = _items.indexWhere((e) => e.name == name);

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(name: name, price: price, quantity: 1));
    }

    notifyListeners();
  }

  void increaseQty(int index) {
    _items[index].quantity++;
    notifyListeners();
  }

  void decreaseQty(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
    } else {
      _items.removeAt(index);
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
