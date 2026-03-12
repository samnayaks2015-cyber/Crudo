import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductScreen extends StatelessWidget {

  final String title;
  final List<Product> products;

  const ProductScreen({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(title),
      ),

      body: GridView.builder(

        padding: const EdgeInsets.all(15),

        itemCount: products.length,

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),

        itemBuilder: (context,index){

          Product product = products[index];

          return Container(

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade200, blurRadius: 10)
              ],
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset(product.image,height:80),

                const SizedBox(height:10),

                Text(product.name),

                const SizedBox(height:5),

                Text("₹${product.price}"),

                const SizedBox(height:10),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add to Cart"),
                )

              ],
            ),
          );
        },
      ),
    );
  }
}
