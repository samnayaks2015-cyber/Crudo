import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> banners = [
    "assets/images/banner1.png",
    "assets/images/banner2.png",
    "assets/images/banner3.png",
  ];

  final List<Map<String, String>> categories = [
    {
      "name": "Milk",
      "image": "assets/images/milk.png",
    },
    {
      "name": "Fruits",
      "image": "assets/images/fruits.png",
    },
    {
      "name": "Vegetables",
      "image": "assets/images/vegetables.png",
    },
    {
      "name": "Dairy",
      "image": "assets/images/dairy.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[100],

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Container(
          padding: const EdgeInsets.only(top: 40,left: 16,right: 16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff8E2DE2), Color(0xff4A00E0)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Delivery to",
                style: TextStyle(color: Colors.white70),
              ),

              const Text(
                "Bharathi",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Search milk, fruits...",
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 15),

            // Banner slider
            CarouselSlider(
              options: CarouselOptions(
                height: 170,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: banners.map((item) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(item, fit: BoxFit.cover),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Offer cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  offerCard("60% OFF"),
                  offerCard("₹200 OFF"),
                  offerCard("FAST DELIVERY"),

                ],
              ),
            ),

            const SizedBox(height: 25),

            // Category title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Shop by Category",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Category grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.2),
                itemBuilder: (context, index) {

                  var category = categories[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 6,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Image.asset(
                          category["image"]!,
                          height: 90,
                        ),

                        const SizedBox(height: 10),

                        Text(
                          category["name"]!,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )

                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 80),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.shopping_cart),
        onPressed: () {},
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),

        ],
      ),
    );
  }

  Widget offerCard(String text) {
    return Container(
      height: 80,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
