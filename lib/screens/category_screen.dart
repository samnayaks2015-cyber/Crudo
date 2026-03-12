import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {

  final String categoryName;

  const CategoryScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {

    List<String> items = [];

    if(categoryName == "Milk"){
      items = ["Cow Milk","Buffalo Milk","Organic Milk"];
    }

    if(categoryName == "Fruits"){
      items = ["Apple","Banana","Mango"];
    }

    if(categoryName == "Vegetables"){
      items = ["Tomato","Carrot","Potato"];
    }

    if(categoryName == "Dairy"){
      items = ["Curd","Butter","Paneer"];
    }

    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){

          return ListTile(
            title: Text(items[index]),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text("Add"),
            ),
          );
        },
      ),
    );
  }
}
