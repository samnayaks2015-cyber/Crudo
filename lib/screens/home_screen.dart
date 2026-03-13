import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int cartCount = 0;
  double total = 0;
  List cartItems = [];

  final List banners = [
    "assets/images/banner.png",
    "assets/images/banner.png"
  ];

  final List categories = [
    {"name":"Milk","image":"assets/images/milk.png"},
    {"name":"Fruits","image":"assets/images/fruits.png"},
    {"name":"Vegetables","image":"assets/images/vegetables.png"},
    {"name":"Dairy","image":"assets/images/dairy.png"}
  ];

  final List products = [
    {"name":"Cow Milk","price":60,"image":"assets/images/milk.png"},
    {"name":"Buffalo Milk","price":70,"image":"assets/images/milk.png"},
    {"name":"Apple","price":120,"image":"assets/images/fruits.png"},
    {"name":"Banana","price":50,"image":"assets/images/fruits.png"},
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
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=> CartScreen(
                        cartItems: cartItems,
                        total: total,
                      ),
                    ),
                  );
                },
              ),

              if(cartCount>0)
              Positioned(
                right:5,
                top:5,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    cartCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize:12,
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

            const SizedBox(height:10),

            /// SEARCH BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search milk, fruits, vegetables",
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

            const SizedBox(height:20),

            /// BANNER SLIDER
            CarouselSlider(
              options: CarouselOptions(
                height:180,
                autoPlay:true,
                viewportFraction:1,
              ),

              items: banners.map((img){

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal:10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      img,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                );

              }).toList(),
            ),

            const SizedBox(height:20),

            /// CATEGORY TITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:16),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height:15),

            /// CATEGORY LIST
            SizedBox(
              height:100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,

                itemBuilder:(context,index){

                  var category = categories[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12),
                    child: Column(
                      children: [

                        Container(
                          padding: const EdgeInsets.all(12),
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

            /// POPULAR PRODUCTS
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:16),
              child: Text(
                "Popular Products",
                style: TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height:15),

            GridView.builder(
              shrinkWrap:true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal:16),
              itemCount: products.length,

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                crossAxisSpacing:15,
                mainAxisSpacing:15,
                childAspectRatio:0.8,
              ),

              itemBuilder:(context,index){

                var product = products[index];

                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow:[
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius:5,
                      )
                    ],
                  ),

                  child: Column(
                    children: [

                      Image.asset(product["image"],height:70),

                      const SizedBox(height:10),

                      Text(
                        product["name"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height:5),

                      Text("₹${product["price"]}"),

                      const Spacer(),

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

    );
  }
}
