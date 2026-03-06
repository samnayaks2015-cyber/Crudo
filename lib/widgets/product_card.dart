import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String image;
  final int price;

  const ProductCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  int qty = 0;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 170,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0,5),
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          /// PRODUCT IMAGE
          SizedBox(
            height: 90,
            child: Image.asset(widget.image),
          ),

          const SizedBox(height: 10),

          /// NAME
          Text(
            widget.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 4),

          /// PRICE
          Text(
            "₹${widget.price}",
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 10),

          /// ADD BUTTON
          qty == 0
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: (){
                    setState(() {
                      qty = 1;
                    });
                  },
                  child: const Text("ADD"),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.red,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.remove,size:16,color: Colors.white),
                        onPressed: (){
                          setState(() {
                            if(qty>0) qty--;
                          });
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:12),
                      child: Text(
                        qty.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.green,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.add,size:16,color: Colors.white),
                        onPressed: (){
                          setState(() {
                            qty++;
                          });
                        },
                      ),
                    ),

                  ],
                )

        ],
      ),
    );
  }
}
