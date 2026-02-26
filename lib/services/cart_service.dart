import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalItems =>
      _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.total);

  // ADD TO CART
  void addToCart(String id, String name, double price) {
    try {
      final index = _items.indexWhere((item) => item.id == id);

      if (index >= 0) {
        _items[index].quantity++;
      } else {
        _items.add(
          CartItem(
            id: id,
            name: name,
            price: price,
          ),
        );
      }

      notifyListeners();
    } catch (e) {
      debugPrint("Cart error: $e");
    }
  }

  // REMOVE ITEM
  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  // INCREASE
  void increaseQty(String id) {
    final item = _items.firstWhere((item) => item.id == id);
    item.quantity++;
    notifyListeners();
  }

  // DECREASE
  void decreaseQty(String id) {
    final item = _items.firstWhere((item) => item.id == id);

    if (item.quantity > 1) {
      item.quantity--;
    } else {
      removeItem(id);
    }

    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
