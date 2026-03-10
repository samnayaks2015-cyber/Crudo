import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Product"),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Image.asset(
                "assets/images/milk.png",
                height: 200,
              ),
            ),

            const SizedBox(height:20),

            const Text(
              "Buffalo Milk",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height:10),

            const Text(
              "₹120 per litre",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.green
              ),
            ),

            const SizedBox(height:20),

            const Text(
              "Fresh farm buffalo milk delivered every morning.",
            ),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity,50),
              ),
              onPressed: () {},
              child: const Text("Add to Cart"),
            )

          ],
        ),
      ),
    );
  }
}
