import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  final List bannerImages = [
    "assets/images/banner1.png",
  ];

  final List categories = [
    {"name": "Milk", "image": "assets/images/milk.png"},
    {"name": "Fruits", "image": "assets/images/fruits.png"},
    {"name": "Vegetables", "image": "assets/images/vegetables.png"},
    {"name": "Dairy", "image": "assets/images/dairy.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: const [

          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"),

          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: "Subscription"),

          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart"),

          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// HEADER
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff7B1FA2),
                      Color(0xff9C27B0),
                    ],
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
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.search),
                            hintText: "Search milk, fruits..."),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// BANNER SLIDER
              CarouselSlider(
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: bannerImages.map((image) {

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover)),
                  );

                }).toList(),
              ),

              const SizedBox(height: 20),

              /// OFFERS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    offerBox("60% OFF"),
                    offerBox("₹200 OFF"),
                    offerBox("FAST DELIVERY"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// CATEGORY TITLE
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
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

              /// CATEGORY GRID
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.2),
                itemBuilder: (context,index){

                  var category = categories[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 10)
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Image.asset(
                          category["image"],
                          height: 80,
                        ),

                        const SizedBox(height: 10),

                        Text(
                          category["name"],
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 40),

            ],
          ),
        ),
      ),
    );
  }

  Widget offerBox(String text){
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
