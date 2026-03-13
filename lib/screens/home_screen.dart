import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'cart_screen.dart';
import 'subscription_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int cartCount = 0;
  int navIndex = 0;

  List cartItems = [];
  double total = 0;

  final List bannerImages = [
    "assets/images/banner1.png",
    "assets/images/banner2.png",
  ];

  final List categories = [
    {"name": "Milk", "image": "assets/images/milk.png"},
    {"name": "Fruits", "image": "assets/images/fruits.png"},
    {"name": "Vegetables", "image": "assets/images/vegetables.png"},
    {"name": "Dairy", "image": "assets/images/dairy.png"},
  ];

  final List products = [
    {"name": "Cow Milk", "price": 60, "image": "assets/images/milk.png"},
    {"name": "Buffalo Milk", "price": 70, "image": "assets/images/milk.png"},
    {"name": "Apple", "price": 120, "image": "assets/images/fruits.png"},
    {"name": "Banana", "price": 50, "image": "assets/images/fruits.png"},
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("CRUDO"),
        backgroundColor: Colors.green,
        actions: [

          Stack(
            children: [

              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(
                        cartItems: cartItems,
                        total: total,
                      ),
                    ),
                  );

                },
              ),

              if(cartCount>0)
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
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

            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "Deliver to Bharathi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search milk, fruits, vegetables...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height:15),

            CarouselSlider(
              options: CarouselOptions(
                height:170,
                viewportFraction:1,
                autoPlay:true,
              ),
              items: bannerImages.map((img) {

                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal:10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      img,
                      fit: BoxFit.cover,
                    ),
                  ),
                );

              }).toList(),
            ),

            const SizedBox(height:20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal:12),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize:18,
                  fontWeight:FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height:12),

            SizedBox(
              height:90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder:(context,index){

                  var category = categories[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10),
                    child: Column(
                      children: [

                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow:[
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius:5,
                              )
                            ],
                          ),
                          child: Image.asset(
                            category["image"],
                            height:40,
                          ),
                        ),

                        const SizedBox(height:5),

                        Text(category["name"])

                      ],
                    ),
                  );

                },
              ),
            ),

            const SizedBox(height:20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal:12),
              child: Text(
                "Popular Products",
                style: TextStyle(
                  fontSize:18,
                  fontWeight:FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height:12),

            GridView.builder(
              shrinkWrap:true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal:12),
              itemCount: products.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                crossAxisSpacing:10,
                mainAxisSpacing:10,
                childAspectRatio:0.8,
              ),

              itemBuilder:(context,index){

                var product = products[index];

                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius:5,
                      )
                    ],
                  ),

                  child: Column(
                    children: [

                      Image.asset(product["image"], height:70),

                      const SizedBox(height:10),

                      Text(product["name"]),

                      Text(
                        "₹${product["price"]}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height:8),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: (){

                          setState(() {

                            cartItems.add(product);

                            cartCount = cartItems.length;

                            total += product["price"];

                          });

                        },
                        child: const Text("ADD"),
                      )

                    ],
                  ),
                );

              },
            ),

            const SizedBox(height:80)

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: navIndex,
        selectedItemColor: Colors.green,

        onTap:(index){

          if(index==1){

            Navigator.push(
              context,
              MaterialPageRoute(
                builder:(context)=> const SubscriptionScreen(),
              ),
            );

          }

          if(index==2){

            Navigator.push(
              context,
              MaterialPageRoute(
                builder:(context)=> CartScreen(
                  cartItems: cartItems,
                  total: total,
                ),
              ),
            );

          }

        },

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
