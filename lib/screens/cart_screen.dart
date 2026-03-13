import 'package:flutter/material.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {

  final List cartItems;
  final double total;

  const CartScreen({
    super.key,
    required this.cartItems,
    required this.total,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  late List cartItems;
  late double total;

  @override
  void initState() {
    super.initState();

    cartItems = widget.cartItems;
    total = widget.total;

    /// Add quantity field if not present
    for (var item in cartItems) {
      item["qty"] ??= 1;
    }
  }

  void increaseQty(int index) {
    setState(() {

      cartItems[index]["qty"]++;

      total += cartItems[index]["price"];

    });
  }

  void decreaseQty(int index) {

    if (cartItems[index]["qty"] > 1) {

      setState(() {

        cartItems[index]["qty"]--;

        total -= cartItems[index]["price"];

      });

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Cart"),
      ),

      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Cart is empty",
                style: TextStyle(fontSize:18),
              ),
            )
          : Column(
              children: [

                /// CART ITEMS
                Expanded(

                  child: ListView.builder(

                    itemCount: cartItems.length,

                    itemBuilder: (context,index){

                      var item = cartItems[index];

                      return Card(

                        margin: const EdgeInsets.symmetric(
                          horizontal:12,
                          vertical:6,
                        ),

                        child: Padding(

                          padding: const EdgeInsets.all(10),

                          child: Row(

                            children: [

                              /// PRODUCT IMAGE
                              Image.asset(
                                item["image"],
                                width:60,
                                height:60,
                              ),

                              const SizedBox(width:10),

                              /// PRODUCT INFO
                              Expanded(

                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,

                                  children: [

                                    Text(
                                      item["name"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:16,
                                      ),
                                    ),

                                    const SizedBox(height:5),

                                    Text(
                                      "₹${item["price"]}",
                                      style: const TextStyle(
                                        fontSize:14,
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                              /// QUANTITY BUTTONS
                              Row(
                                children: [

                                  IconButton(
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                    ),
                                    onPressed: (){
                                      decreaseQty(index);
                                    },
                                  ),

                                  Text(
                                    item["qty"].toString(),
                                    style: const TextStyle(
                                      fontSize:16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  IconButton(
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                    ),
                                    onPressed: (){
                                      increaseQty(index);
                                    },
                                  ),

                                ],
                              )

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                /// TOTAL + CHECKOUT
                Container(

                  padding: const EdgeInsets.all(16),

                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius:5,
                      )
                    ],
                  ),

                  child: Column(

                    children: [

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                        children: [

                          const Text(
                            "Total",
                            style: TextStyle(
                              fontSize:20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "₹${total.toStringAsFixed(0)}",
                            style: const TextStyle(
                              fontSize:20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),

                      const SizedBox(height:15),

                      SizedBox(
                        width: double.infinity,
                        height:50,

                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),

                          onPressed: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>
                                    CheckoutScreen(total: total),
                              ),
                            );

                          },

                          child: const Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize:18,
                            ),
                          ),

                        ),
                      )

                    ],
                  ),
                )

              ],
            ),

    );
  }
}
