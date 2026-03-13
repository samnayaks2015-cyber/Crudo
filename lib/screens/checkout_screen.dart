import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.green,
      ),

      body: const Center(
        child: Text(
          "Checkout system coming soon",
          style: TextStyle(fontSize:18),
        ),
      ),

    );
  }
}
