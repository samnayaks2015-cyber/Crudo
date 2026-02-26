import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import '../utils/app_colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: AppColors.primary,
      ),
      body: cart.cartItems.isEmpty
          ? const Center(child: Text("Cart is empty"))
          : ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                final item = cart.cartItems[index];
                return ListTile(
                  title: Text(item["name"]),
                  subtitle: Text("₹${item["price"]}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      cart.removeItem(index);
                      (context as Element).markNeedsBuild();
                    },
                  ),
                );
              },
            ),
    );
  }
}
