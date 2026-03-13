import 'package:flutter/material.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {

  final List cartItems;
  final double total;

  const CartScreen({
    super.key,
    required this.cartItems,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder:(context,index){

                var item = cartItems[index];

                return ListTile(
                  leading: Image.asset(item["image"], width:50),
                  title: Text(item["name"]),
                  trailing: Text("₹${item["price"]}"),
                );

              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                Text(
                  "Total ₹$total",
                  style: const TextStyle(
                    fontSize:22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height:15),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity,50),
                  ),
                  onPressed:(){

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:(context)=> const CheckoutScreen(),
                      ),
                    );

                  },
                  child: const Text("Checkout"),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}
