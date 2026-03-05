import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/cart_service.dart';

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Column(

        children: [

          Image.asset(product.image,height:80),

          const SizedBox(height:10),

          Text(product.name),

          Text(
            "₹${product.price}",
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold
            ),
          ),

          ElevatedButton(

            onPressed: (){
              CartService.add(product);
            },

            child: const Text("Add"),

          )

        ],
      ),
    );
  }
}
