import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {

  final double total;

  const CheckoutScreen({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Delivery Address",
              style: TextStyle(
                fontSize:18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height:10),

            TextField(
              decoration: InputDecoration(
                hintText: "Enter address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height:30),

            Text(
              "Total: ₹$total",
              style: const TextStyle(
                fontSize:22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height:30),

            SizedBox(
              width: double.infinity,
              height:55,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),

                onPressed: (){

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Order Placed Successfully"),
                    ),
                  );

                },

                child: const Text(
                  "PLACE ORDER",
                  style: TextStyle(fontSize:18),
                ),
              ),
            )

          ],
        ),
      ),

    );
  }
}
