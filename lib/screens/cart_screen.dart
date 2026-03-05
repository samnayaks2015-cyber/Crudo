import 'package:flutter/material.dart';
import '../services/cart_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: const Text("Cart")),

      body: ListView.builder(

        itemCount: CartService.cartItems.length,

        itemBuilder: (context,index){

          final item = CartService.cartItems[index];

          return ListTile(

            leading: Image.asset(item.image,width:50),

            title: Text(item.name),

            trailing: Text("₹${item.price}"),

          );
        },
      ),

    );
  }
}
