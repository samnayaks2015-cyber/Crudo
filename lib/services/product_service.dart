import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {

  static Future<List> getProducts() async {

    List products = [];

    QuerySnapshot snapshot =
        await FirebaseFirestore.instance
        .collection("products")
        .get();

    for(var doc in snapshot.docs){

      products.add(doc.data());

    }

    return products;

  }

}
