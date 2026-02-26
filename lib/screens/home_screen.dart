import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUDO'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartScreen(),
                    ),
                  );
                },
              ),
              if (cart.itemCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cart.itemCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: const [
          ProductTile(name: 'Cow Milk', price: 90),
          ProductTile(name: 'Buffalo Milk', price: 130),
          ProductTile(name: 'Tomato', price: 20),
          ProductTile(name: 'Potato', price: 25),
        ],
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final String name;
  final double price;

  const ProductTile({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartService>(context, listen: false);

    return ListTile(
      title: Text(name),
      subtitle: Text('₹$price'),
      trailing: ElevatedButton(
        onPressed: () {
          cart.addItem(name, price);
        },
        child: const Text('Add'),
      ),
    );
  }
}
