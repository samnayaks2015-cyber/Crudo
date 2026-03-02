class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class CartService {
  // 🔹 singleton (IMPORTANT)
  static final CartService _instance = CartService._internal();

  factory CartService() {
    return _instance;
  }

  CartService._internal();

  // 🔹 cart storage
  final List<CartItem> _items = [];

  // ✅ getter for items
  List<CartItem> get items => _items;

  // ✅ REQUIRED — fixes your red error
  int get cartCount => _items.fold(
        0,
        (sum, item) => sum + item.quantity,
      );

  // ✅ total price
  double get totalPrice => _items.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );

  // ✅ add item
  void addItem(String name, double price) {
    try {
      final index = _items.indexWhere((e) => e.name == name);

      if (index != -1) {
        _items[index].quantity++;
      } else {
        _items.add(
          CartItem(name: name, price: price),
        );
      }
    } catch (e) {
      // safety
    }
  }

  // ✅ remove item
  void removeItem(String name) {
    _items.removeWhere((e) => e.name == name);
  }

  // ✅ clear cart
  void clearCart() {
    _items.clear();
  }
}
