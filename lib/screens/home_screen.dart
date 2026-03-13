import 'package:flutter/material.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Map<String, dynamic>> products = [
    {
      "name": "Cow Milk",
      "price": 60,
      "image": "assets/images/milk.png"
    },
    {
      "name": "Buffalo Milk",
      "price": 70,
      "image": "assets/images/milk.png"
    },
    {
      "name": "Apple",
      "price": 120,
      "image": "assets/images/fruits.png"
    },
    {
      "name": "Banana",
      "price": 50,
      "image": "assets/images/fruits.png"
    },
  ];

  List<Map<String, dynamic>> cart = [];

  void addToCart(Map<String, dynamic> product) {
    setState(() {
      cart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("CRUDO"),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      cart.length.toString(),
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
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
          children: [

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search milk, fruits, vegetables...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage("assets/images/banner.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CategoryItem("Milk", "assets/images/milk.png"),
                CategoryItem("Fruits", "assets/images/fruits.png"),
                CategoryItem("Vegetables", "assets/images/vegetables.png"),
                CategoryItem("Dairy", "assets/images/dairy.png"),
              ],
            ),

            const SizedBox(height: 20),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Products",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {

                final product = products[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [

                      Expanded(
                        child: Image.asset(product["image"]),
                      ),

                      Text(
                        product["name"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text("₹${product["price"]}"),

                      const SizedBox(height: 5),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          addToCart(product);
                        },
                        child: const Text("Add"),
                      ),

                      const SizedBox(height: 8)

                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {

  final String name;
  final String image;

  const CategoryItem(this.name, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 5),

        Text(name),

      ],
    );
  }
}
