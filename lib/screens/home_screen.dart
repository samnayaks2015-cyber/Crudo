import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int cartCount = 0;

  final List banners = [
    "assets/images/banner1.png",
  ];

  final List categories = [
    {"name": "Milk", "image": "assets/images/milk.png"},
    {"name": "Fruits", "image": "assets/images/fruits.png"},
    {"name": "Vegetables", "image": "assets/images/vegetables.png"},
    {"name": "Dairy", "image": "assets/images/dairy.png"},
  ];

  final List products = [
    {"name": "Cow Milk", "price": "₹60", "image": "assets/images/milk.png"},
    {"name": "Buffalo Milk", "price": "₹70", "image": "assets/images/milk.png"},
    {"name": "Apple", "price": "₹120", "image": "assets/images/fruits.png"},
    {"name": "Banana", "price": "₹60", "image": "assets/images/fruits.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("CRUDO"),
        actions: [

          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),

              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    cartCount.toString(),
                    style: const TextStyle(color: Colors.white,fontSize: 12),
                  ),
                ),
              )
            ],
          )

        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// BANNER
            CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                viewportFraction: 0.95,
                enlargeCenterPage: true,
              ),
              items: banners.map((image) {

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                );

              }).toList(),
            ),

            const SizedBox(height: 20),

            /// CATEGORY TITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Shop by Category",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 15),

            /// CATEGORY GRID
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: categories.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.2),

              itemBuilder: (context,index){

                var category = categories[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300,blurRadius: 5)
                    ],
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image.asset(category["image"],height:70),

                      const SizedBox(height:10),

                      Text(
                        category["name"],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            /// PRODUCT TITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Popular Products",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 15),

            /// PRODUCT GRID
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: products.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.8),

              itemBuilder: (context,index){

                var product = products[index];

                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300,blurRadius: 5)
                    ],
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image.asset(product["image"],height:70),

                      const SizedBox(height:10),

                      Text(product["name"]),

                      const SizedBox(height:5),

                      Text(
                        product["price"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height:10),

                      ElevatedButton(
                        onPressed: (){
                          setState(() {
                            cartCount++;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text("Add"),
                      )

                    ],
                  ),
                );

              },
            ),

            const SizedBox(height: 80)

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.repeat),
            label: "Subscription",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
