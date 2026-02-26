import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/cart_service.dart';

class CartScreen extends StatelessWidget {
const CartScreen({super.key});

@override
Widget build(BuildContext context) {
final cart = Provider.of<CartService>(context);

return Scaffold(
  appBar: AppBar(
    title: const Text('My Cart'),
    backgroundColor: Colors.green,
    centerTitle: true,
  ),
  body: cart.items.isEmpty
      ? const Center(
          child: Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 18),
          ),
        )
      : Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items.values.toList()[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        // icon
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.local_drink,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(width: 12),

                        // name + price
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '₹${item.price} x ${item.quantity}',
                              ),
                            ],
                          ),
                        ),

                        // remove button
                        IconButton(
                          onPressed: () {
                            cart.removeItem(item.id);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // 🔥 Total section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    color: Colors.black12,
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Total: ₹${cart.totalAmount.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Checkout'),
                  ),
                ],
              ),
            ),
          ],
        ),
);

}
}
