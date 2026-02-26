import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // ➕ Add to cart
  void addItem(String id, String name, double price) {
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
  }

  // ➖ decrease qty
  void decreaseQty(String id) {
    final index = _items.indexWhere((item) => item.id == id);

    if (index >= 0) {
      if (_items[index].quantity > 1) {
