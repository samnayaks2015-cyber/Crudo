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

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            subscriptionCard("Cow Milk","₹90 / day"),
            subscriptionCard("Buffalo Milk","₹120 / day"),

          ],
        ),
      ),
    );
  }

  Widget subscriptionCard(String name,String price){

    return Card(

      margin: const EdgeInsets.only(bottom:15),

      child: ListTile(

        leading: const CircleAvatar(
          backgroundColor: Colors.green,
        ),

        title: Text(name),

        subtitle: Text(price),

        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          onPressed: () {},
          child: const Text("Subscribe"),
        ),

      ),
    );
  }
}
