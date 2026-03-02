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

  int getQty(String name) {
    return cart.items[name]?.quantity ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6fa),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "CRUDO",
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
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      cart.totalItems.toString(),
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
        ],
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.72,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          final qty = getQty(product['name']);

          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(product['image'], height: 90),

                Text(
                  product['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "₹${product['price']}",
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                qty == 0
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            cart.addItem(
                              product['name'],
                              product['price'],
                            );
                          });
                        },
                        child: const Text("Add"),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove,
                                  color: Colors.green),
                              onPressed: () {
                                setState(() {
                                  cart.removeItem(product['name']);
                                });
                              },
                            ),
                            Text(
                              qty.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              icon:
                                  const Icon(Icons.add, color: Colors.green),
                              onPressed: () {
                                setState(() {
                                  cart.addItem(
                                    product['name'],
                                    product['price'],
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          );
        },
      ),

      // ✅ BOTTOM BAR (Country Delight feel)
      bottomNavigationBar: cart.totalItems == 0
          ? null
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${cart.totalItems} items | ₹${cart.totalPrice.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CartScreen(cart: cart),
                        ),
                      ).then((_) => setState(() {}));
                    },
                    child: const Text("View Cart"),
                  ),
                ],
              ),
            ),
    );
  }
}
