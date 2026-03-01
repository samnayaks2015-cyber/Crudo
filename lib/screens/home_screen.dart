import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CartService cart = CartService();

  final List<Map<String, dynamic>> products = [
    {
      "name": "Cow Milk",
      "price": 90.0,
      "icon": Icons.local_drink,
    },
    {
      "name": "Buffalo Milk",
      "price": 130.0,
      "icon": Icons.opacity,
    },
    {
      "name": "Apple",
      "price": 120.0,
      "icon": Icons.apple,
    },
    {
      "name": "Banana",
      "price": 60.0,
      "icon": Icons.set_meal,
    },
  ];

  void addToCart(String name, double price) {
    setState(() {
      // ✅ IMPORTANT FIX — named parameters
      cart.addItem(name: name, price: price);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$name added to cart"),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  Widget productCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              product["icon"],
              size: 48,
              color: Colors.green,
            ),
            Text(
              product["name"],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              "₹${product["price"]}",
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    addToCart(product["name"], product["price"]),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6fa),
      appBar: AppBar(
        title: const Text("CRUDO"),
        backgroundColor: Colors.green,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CartScreen(cart: cart),
                    ),
                  ).then((_) => setState(() {}));
                },
              ),
              if (cart.items.isNotEmpty)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.red,
                    child: Text(
                      cart.items.length.toString(),
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      // ✅ BODY
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return productCard(products[index]);
          },
        ),
      ),
    );
  }
}
