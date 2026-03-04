import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final cart = CartService.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: const Text("Cart")),

      body: Column(

        children: [

          Expanded(

            child: ListView.builder(

              itemCount: cart.items.length,

              itemBuilder:(context,index){

                final item = cart.items[index];

                return ListTile(

                  leading: Image.asset(item.product.image,width:40),

                  title: Text(item.product.name),

                  subtitle: Text("₹${item.product.price} x ${item.quantity}"),

                );

              }

            ),

          ),

          Text("Total ₹${cart.total}",style: const TextStyle(fontSize:20)),

          ElevatedButton(

            onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CheckoutScreen())
              );

            },

            child: const Text("Checkout"),

          )

        ],

      ),

    );

  }
}
