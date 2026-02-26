class CartService {
  static final CartService _instance = CartService._internal();

  factory CartService() {
    return _instance;
  }

  CartService._internal();

  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addItem(Map<String, dynamic> item) {
    _cartItems.add(item);
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
  }

  void clearCart() {
    _cartItems.clear();
  }

  int get itemCount => _cartItems.length;
}
