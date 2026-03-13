import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List<Map<String, dynamic>> cartItems = [
    {"name": "Cow Milk", "price": 60},
    {"name": "Buffalo Milk", "price": 70},
    {"name": "Apple", "price": 120},
    {"name": "Banana", "price": 50},
  ];

  double get total {
    double sum = 0;
    for (var item in cartItems) {
      sum += item["price"];
    }
    return sum;
  }

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
              itemBuilder: (context, index) {

                final item = cartItems[index];

                return ListTile(
                  leading: const Icon(Icons.shopping_bag),
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
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {},
                    child: const Text("Checkout"),
                  ),
                )

              ],
            ),
          )

        ],
      ),
    );
  }
}
