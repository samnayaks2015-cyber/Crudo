body: CartService.cart.isEmpty
    ? const Center(
        child: Text(
          "Your cart is empty",
          style: TextStyle(fontSize: 18),
        ),
      )
    : ListView(
        children: CartService.cart.entries.map((item){

          int price = item.key == "Cow Milk" ? 90 : 130;

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),

            child: ListTile(

              title: Text(
                item.key,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text("Quantity: ${item.value}"),

              trailing: Text(
                "₹${item.value * price}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          );

        }).toList(),
      ),
