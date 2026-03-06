import 'package:flutter/material.dart';
import '../widgets/banner_slider.dart';
import '../widgets/product_card.dart';
import '../widgets/category_card.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F5F5),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

        title: Row(
          children: [

            Image.asset(
              "assets/images/logo.png",
              height: 36,
            ),

            const SizedBox(width: 10),

            const Text(
              "CRUDO",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),

        actions: [

          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );

            },
          )

        ],
      ),

      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const SizedBox(height: 10),

            /// BANNERS
            const BannerSlider(),

            const SizedBox(height: 20),

            /// CATEGORIES TITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// CATEGORIES ROW
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: const [

                  CategoryCard(
                    title: "Milk",
                    icon: "🥛",
                  ),

                  CategoryCard(
                    title: "Fruits",
                    icon: "🍎",
                  ),

                  CategoryCard(
                    title: "Vegetables",
                    icon: "🥕",
                  ),

                  CategoryCard(
                    title: "Dairy",
                    icon: "🧀",
                  ),

                ],
              ),
            ),

            const SizedBox(height: 25),

            /// POPULAR PRODUCTS
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Popular Products",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// PRODUCT LIST
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: const [

                  ProductCard(
                    name: "Cow Milk",
                    price: 90,
                    image: "assets/images/cowmilk.png",
                  ),

                  ProductCard(
                    name: "Buffalo Milk",
                    price: 130,
                    image: "assets/images/buffalomilk.png",
                  ),

                ],
              ),
            ),

            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}
