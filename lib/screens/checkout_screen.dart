import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {

  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Checkout"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(

          children: [

            const Text(
              "Select Payment Method",
              style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),
            ),

            const SizedBox(height:20),

            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text("UPI"),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text("Card"),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.money),
              title: const Text("Cash on Delivery"),
              onTap: () {},
            ),

          ],
        ),
      ),
    );
  }
}
