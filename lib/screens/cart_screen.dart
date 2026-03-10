import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: [

          cartItem("Cow Milk","₹90"),
          cartItem("Buffalo Milk","₹120"),

          const Spacer(),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey,blurRadius: 5)
              ],
            ),

            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [

                    Text("Total",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        )),

                    Text("₹210",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        )),

                  ],
                ),

                const SizedBox(height:10),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity,50),
                  ),
                  onPressed: () {},
                  child: const Text("Checkout"),
                )

              ],
            ),
          )

        ],
      ),
    );
  }

  Widget cartItem(String name,String price){

    return ListTile(

      leading: const CircleAvatar(
        backgroundColor: Colors.green,
      ),

      title: Text(name),

      subtitle: Text(price),

      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_circle)
          ),

          const Text("1"),

          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle)
          )

        ],
      ),

    );
  }
}
