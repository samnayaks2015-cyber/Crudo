import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/cart_service.dart';
import '../screens/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUDO'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Text(
                  'Cart: ${cart.itemCount}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
