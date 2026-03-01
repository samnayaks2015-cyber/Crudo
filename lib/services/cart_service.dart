import 'cart_item.dart';

class CartService {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem({required String name, required double price}) {
    _items.add(CartItem(name: name, price: price));
  }

  void removeItem(int index) {
    _items.removeAt(index);
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.price);
  }
}
