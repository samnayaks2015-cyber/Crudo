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

  void addToCart(Map<String, dynamic> product) {
    setState(() {
      widget.cart.addItem(
        name: product['name'],
        price: product['price'],
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartCount = widget.cart.totalItems;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'CRUDO',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
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
                      builder: (_) => CartScreen(cart: widget.cart),
                    ),
                  ).then((_) => setState(() {}));
                },
              ),
              if (cartCount > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFF2E7D32),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cartCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
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
            childAspectRatio: 0.78,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.12),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        product['image'],
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '₹${product['price']}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xFF2E7D32),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: OutlinedButton(
                        onPressed: () => addToCart(product),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFF6A1B9A),
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Add',
                          style: TextStyle(
                            color: Color(0xFF6A1B9A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
