import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = CartService();

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(product.image, height: 80),
          const SizedBox(height: 8),
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("₹${product.price}"),
          const SizedBox(height: 6),
          ElevatedButton(
            onPressed: () {
              cart.addItem({
                "name": product.name,
                "price": product.price,
              });

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Added to cart")),
              );
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
