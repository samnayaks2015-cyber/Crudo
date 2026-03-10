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
    "assets/images/banner2.png",
    "assets/images/banner3.png",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[100],

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
                      Color(0xff9C27B0)
                    ],
                  ),
                ),

                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "Delivery to",
                              style: TextStyle(
                                  color: Colors.white70
                              ),
                            ),

                            Text(
                              "Bharathi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                          ],
                        ),

                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person),
                        )

                      ],
                    ),

                    const SizedBox(height: 15),

                    /// SEARCH BAR

                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: const Row(
                        children: [

                          Icon(Icons.search),

                          SizedBox(width: 10),

                          Expanded(
                            child: Text(
                              "Search milk, fruits...",
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            ),
                          ),

                          Icon(Icons.mic)

                        ],
                      ),
                    )

                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// BANNER SLIDER

              CarouselSlider(
                options: CarouselOptions(
                  height: 160,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),

                items: banners.map((e){

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      e,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );

                }).toList(),
              ),

              const SizedBox(height: 20),

              /// OFFER CARDS

              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [

                    offerCard("60% OFF"),
                    offerCard("₹200 OFF"),
                    offerCard("FAST DELIVERY"),
                    offerCard("ORGANIC"),

                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// CATEGORY SECTION

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [

                    Text(
                      "Shop by Category",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    )

                  ],
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [

                    category("Milk","assets/images/milk.png"),
                    category("Fruits","assets/images/fruits.png"),
                    category("Vegetables","assets/images/vegetables.png"),
                    category("Dairy","assets/images/dairy.png"),

                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// PRODUCT GRID

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [

                  product("Cow Milk","₹90","assets/images/milk.png"),
                  product("Buffalo Milk","₹120","assets/images/milk.png"),
                  product("Apples","₹140","assets/images/fruits.png"),
                  product("Tomatoes","₹40","assets/images/vegetables.png"),

                ],
              ),

              const SizedBox(height: 40)

            ],
          ),
        ),
      ),

      /// FLOATING CART

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.shopping_cart),
        onPressed: () {},
      ),

      /// BOTTOM NAVIGATION

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,

        items: const [

          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: "Store"
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart"
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"
          ),

        ],
      ),
    );
  }

  /// OFFER CARD

  Widget offerCard(String text){

    return Container(
      width: 100,
      margin: const EdgeInsets.only(left: 15),
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
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  /// CATEGORY CARD

  Widget category(String name,String image){

    return Container(
      width: 90,
      margin: const EdgeInsets.only(left: 15),
      child: Column(
        children: [

          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(image),
            ),
          ),

          const SizedBox(height: 5),

          Text(name)

        ],
      ),
    );
  }

  /// PRODUCT CARD

  Widget product(String name,String price,String image){

    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5)
        ],
      ),

      child: Column(
        children: [

          Expanded(
            child: Image.asset(image),
          ),

          Text(name),

          Text(
            price,
            style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          ElevatedButton(
            onPressed: (){
              setState(() {
                cartCount++;
              });
            },
            child: const Text("ADD"),
          )

        ],
      ),
    );
  }
}
