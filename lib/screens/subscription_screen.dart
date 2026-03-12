import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {

  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Milk Subscription"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(

          children: [

            const Text(
              "Daily Milk Delivery",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height:20),

            const Text("Subscribe for fresh milk every morning"),

            const SizedBox(height:30),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Subscribe Now"),
            ),

          ],
        ),
      ),
    );
  }
}
