import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  final CartService cart;

  const HomeScreen({super.key, required this.cart});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CartService cart;

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Cow Milk',
      'price': 90.0,
      'image': 'assets/images/cow_milk.png',
    },
    {
      'name': 'Buffalo Milk',
      'price': 130.0,
      'image': 'assets/images/buffalo_milk.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    cart = widget.cart;
  }

  void addToCart(Map<String, dynamic> product) {
    cart.addItem(product['name'], product['price']);
    setState(() {});
  }

  Widget productCard(Map<String, dynamic> product) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(product['image'], height: 90),
          const SizedBox(height: 10),
          Text(
            product['name'],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '₹${product['price']}',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => addToCart(product),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple.shade100,
              foregroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3eef6),
      appBar: AppBar(
        backgroundColor: const Color(0xfff3eef6),
        elevation: 0,
        title: const Text(
          'CRUDO',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CartScreen(cart: cart),
                    ),
                  ).then((_) => setState(() {}));
                },
              ),
              if (cart.totalItems > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cart.totalItems.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return productCard(products[index]);
          },
        ),
      ),
    );
  }
}
