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
    "assets/images/banner1.png",
    "assets/images/banner2.png",
    "assets/images/banner3.png",
  ];

  final List categories = [
    {"name":"Milk","image":"assets/images/milk.png"},
    {"name":"Fruits","image":"assets/images/fruits.png"},
    {"name":"Vegetables","image":"assets/images/vegetables.png"},
    {"name":"Dairy","image":"assets/images/dairy.png"},
  ];

  final List products = [
    {"name":"Cow Milk","price":90,"image":"assets/images/milk.png"},
    {"name":"Buffalo Milk","price":120,"image":"assets/images/milk.png"},
    {"name":"Apple","price":140,"image":"assets/images/fruits.png"},
    {"name":"Banana","price":60,"image":"assets/images/fruits.png"},
  ];

  void addToCart(product){

    setState(() {

      cartItems.add({
        "name":product["name"],
        "price":product["price"],
        "image":product["image"],
        "qty":1
      });

      cartCount = cartItems.length;

      total += product["price"];

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            Image.asset("assets/images/logo.png",height:30),
            const SizedBox(width:10),
            const Text("CRUDO"),
          ],
        ),

        actions: [

          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:(context)=>CartScreen(
                    cartItems: cartItems,
                    total: total,
                  ),
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

            const SizedBox(height:10),

            /// SEARCH BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16),
              child: TextField(
                decoration: InputDecoration(
                  hintText:"Search milk, fruits, vegetables",
                  prefixIcon: const Icon(Icons.search),
                  filled:true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height:20),

            /// BANNERS
            CarouselSlider(
              options: CarouselOptions(
                height:170,
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

            /// PRODUCT TITLE
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
                          addToCart(product);
                        },

                        child: const Text("ADD"),

                      )

                    ],
                  ),
                );

              },
            ),

            const SizedBox(height:100)

          ],
        ),
      ),

      /// FLOATING CART BAR
      bottomNavigationBar: cartCount > 0
          ? GestureDetector(

              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(context)=>CartScreen(
                      cartItems: cartItems,
                      total: total,
                    ),
                  ),
                );

              },

              child: Container(

                margin: const EdgeInsets.all(12),

                padding: const EdgeInsets.symmetric(
                  horizontal:20,
                  vertical:15,
                ),

                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Text(
                      "$cartCount Items | ₹${total.toStringAsFixed(0)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize:16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      "VIEW CART",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )

                  ],
                ),
              ),
            )
          : null,

    );

  }
}
