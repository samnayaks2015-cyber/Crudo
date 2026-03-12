import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int total = 0;

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  void calculateTotal(){
    total = 0;

    for(var item in CartService.cartItems){
      total += item.price;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Cart"),
      ),

      body: Column(

        children: [

          Expanded(
            child: ListView.builder(
              itemCount: CartService.cartItems.length,
              itemBuilder: (context,index){

                var product = CartService.cartItems[index];

                return ListTile(
                  leading: Image.asset(product.image,width:50),
                  title: Text(product.name),
                  trailing: Text("₹${product.price}"),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [

                Text(
                  "Total ₹$total",
                  style: const TextStyle(fontSize:20,fontWeight:FontWeight.bold),
                ),

                const SizedBox(height:10),

                ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CheckoutScreen(),
                      ),
                    );
                  },
                  child: const Text("Checkout"),
                )

              ],
            ),
          )

        ],
      ),
    );
  }
}
