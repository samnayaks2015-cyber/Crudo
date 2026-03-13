import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {

  final String title;
  final List items;

  const SubCategoryScreen({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),

      body: GridView.builder(

        padding: const EdgeInsets.all(16),

        itemCount: items.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.85,
        ),

        itemBuilder: (context,index){

          var product = items[index];

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

              ],
            ),
          );

        },

      ),

    );

  }
}
