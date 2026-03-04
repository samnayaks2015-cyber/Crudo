import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/cart_service.dart';
import '../widgets/product_card.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final cart = CartService.instance;

  final products = [

    Product("Cow Milk",90,"assets/images/cow_milk.png"),
    Product("Buffalo Milk",130,"assets/images/buffalo_milk.png")

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Row(
          children: [

            Image.asset("assets/images/logo.png",height:30),

            const SizedBox(width:10),

            const Text("CRUDO")

          ],
        ),

        actions: [

          Stack(
            children: [

              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen())
                  ).then((value)=>setState((){}));

                },
              ),

              if(cart.items.isNotEmpty)
              Positioned(
                right:5,
                top:5,
                child: CircleAvatar(
                  radius:10,
                  backgroundColor:Colors.red,
                  child: Text(
                    cart.items.length.toString(),
                    style: const TextStyle(fontSize:12,color:Colors.white),
                  ),
                ),
              )

            ],
          )

        ],

      ),

      body: GridView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: products.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
          crossAxisSpacing:16,
          mainAxisSpacing:16
        ),

        itemBuilder:(context,index){

          return ProductCard(product: products[index]);

        }

      ),

    );

  }
}
