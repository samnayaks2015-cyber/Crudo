class CartService {
  static final CartService _instance = CartService._internal();

  factory CartService() => _instance;

  CartService._internal();

  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  int get cartCount => _items.fold(
        0,
        (sum, item) => sum + (item['quantity'] as int),
      );

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  void addItem(String name, double price) {
    int index = _items.indexWhere((item) => item['name'] == name);

    if (index != -1) {
      _items[index]['quantity'] += 1;
    } else {
      _items.add({
        'name': name,
        'price': price,
        'quantity': 1,
      });
    }
  }

  void clearCart() {
    _items.clear();
  }
}
