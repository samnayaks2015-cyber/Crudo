import 'package:flutter/material.dart';
import '../widgets/banner_slider.dart';
import '../widgets/cart_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int cartCount = 0;

  Map<String,int> quantities = {
    "Cow Milk":0,
    "Buffalo Milk":0,
    "Tomato":0,
    "Apple":0
  };

  void addItem(String item){
    setState(() {
      quantities[item] = quantities[item]! + 1;
      cartCount++;
    });
  }

  void removeItem(String item){
    if(quantities[item]! > 0){
      setState(() {
        quantities[item] = quantities[item]! - 1;
        cartCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Row(
          children: [

            Image.asset(
              "assets/images/logo.png",
              height: 40,
            ),

            const SizedBox(width:10),

            const Text("CRUDO"),
          ],
        ),

        actions: [

          CartButton(
            cartCount: cartCount,
            onPressed: (){
              Navigator.pushNamed(context, "/cart");
            },
          )

        ],
      ),

      body: ListView(

        children: [

          const SizedBox(height:10),

          /// Banner Slider
          const BannerSlider(),

          const SizedBox(height:20),

          /// Categories
          const Padding(
            padding: EdgeInsets.symmetric(horizontal:16),
            child: Text(
              "Categories",
              style: TextStyle(
                fontSize:18,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          const SizedBox(height:10),

          SizedBox(
            height:100,

            child: ListView(

              scrollDirection: Axis.horizontal,

              children: [

                categoryCard("Milk","🥛"),
                categoryCard("Fruits","🍎"),
                categoryCard("Vegetables","🥕"),
                categoryCard("Dairy","🧀"),

              ],
            ),
          ),

          const SizedBox(height:20),

          /// Products
          const Padding(
            padding: EdgeInsets.symmetric(horizontal:16),
            child: Text(
              "Popular Products",
              style: TextStyle(
                  fontSize:18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          const SizedBox(height:10),

          GridView.count(

            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            crossAxisCount: 2,
            childAspectRatio: 0.75,

            children: [

              productCard(
                "Cow Milk",
                "assets/images/cow_milk.png",
                90,
              ),

              productCard(
                "Buffalo Milk",
                "assets/images/buffalo_milk.png",
                130,
              ),

              productCard(
                "Tomato",
                "assets/images/tomato.png",
                40,
              ),

              productCard(
                "Apple",
                "assets/images/apple.png",
                120,
              ),

            ],
          ),

          const SizedBox(height:30)

        ],
      ),
    );
  }

  Widget categoryCard(String title,String emoji){

    return Container(
      width:90,
      margin: const EdgeInsets.symmetric(horizontal:8),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius:5
          )
        ]
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            emoji,
            style: const TextStyle(fontSize:30),
          ),

          const SizedBox(height:5),

          Text(title)

        ],
      ),
    );
  }

  Widget productCard(String name,String image,int price){

    int qty = quantities[name]!;

    return Card(

      margin: const EdgeInsets.all(10),

      child: Padding(
        padding: const EdgeInsets.all(10),

        child: Column(

          children: [

            Image.asset(
              image,
              height:80,
            ),

            const SizedBox(height:10),

            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height:5),

            Text(
              "₹$price",
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(height:10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                IconButton(
                  icon: const Icon(Icons.remove_circle,color: Colors.red),
                  onPressed: ()=>removeItem(name),
                ),

                Text(qty.toString()),

                IconButton(
                  icon: const Icon(Icons.add_circle,color: Colors.green),
                  onPressed: ()=>addItem(name),
                )

              ],
            )

          ],
        ),
      ),
    );
  }
}
