class CartService {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  int get cartCount => _items.fold(0, (sum, item) => sum + (item['quantity'] as int));

  double get totalPrice => _items.fold(
        0,
        (sum, item) =>
            sum + ((item['price'] as double) * (item['quantity'] as int)),
      );

  void addItem(String name, double price) {
    final index = _items.indexWhere((item) => item['name'] == name);

    if (index >= 0) {
      _items[index]['quantity'] += 1;
    } else {
      _items.add({
        'name': name,
        'price': price,
        'quantity': 1,
      });
    }
  }

  void removeItem(String name) {
    _items.removeWhere((item) => item['name'] == name);
  }

  void clearCart() {
    _items.clear();
  }
}
