import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Milk Subscription"),
        backgroundColor: Colors.green,
      ),

      body: const Center(
        child: Text(
          "Daily Milk Subscription Coming Soon",
          style: TextStyle(fontSize:18),
        ),
      ),

    );
  }
}
