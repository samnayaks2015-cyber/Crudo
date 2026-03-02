class CartService {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  int get cartCount => _items.length;

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += (item['price'] * item['quantity']);
    }
    return total;
  }

  void addItem(String name, double price) {
    for (var item in _items) {
      if (item['name'] == name) {
        item['quantity'] += 1;
        return;
      }
    }

    _items.add({
      'name': name,
      'price': price,
      'quantity': 1,
    });
  }

  void removeItem(String name) {
    _items.removeWhere((item) => item['name'] == name);
  }
}
