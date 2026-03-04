import '../models/cart_item.dart';
import '../models/product.dart';

class CartService {

  static final CartService instance = CartService._internal();
  CartService._internal();

  final List<CartItem> items = [];

  void add(Product product){

    final index = items.indexWhere((i) => i.product.name == product.name);

    if(index >= 0){
      items[index].quantity++;
    } else {
      items.add(CartItem(product,1));
    }

  }

  void remove(CartItem item){
    items.remove(item);
  }

  int get total {

    int t = 0;

    for(var i in items){
      t += i.product.price * i.quantity;
    }

    return t;
  }

}
