import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cart = CartService();

  final List<Map<String, dynamic>> products = [
    {"name": "Cow Milk", "price": 90.0, "icon": Icons.local_drink},
    {"name": "Buffalo Milk", "price": 130.0, "icon": Icons.water_drop},
    {"name": "Apple", "price": 120.0, "icon": Icons.apple},
    {"name": "Banana", "price": 60.0, "icon": Icons.set_meal},
  ];

  void addToCart(String name, double price) {
    setState(() {
      cart.addItem(name: name, price: price);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$name added to cart")),
    );
  }

  Widget categoryChip(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: Colors.green.shade100,
          child: Icon(icon, color: Colors.green),
        ),
        const SizedBox(height: 6),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget productCard(Map<String, dynamic> product) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black12,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(product["icon"], size: 48, color: Colors.green),
          Text(
            product["name"],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "₹${product["price"]}",
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () =>
                addToCart(product["name"], product["price"]),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Add"),
          )
