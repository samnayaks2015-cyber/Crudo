import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CrudoApp());
}

class CrudoApp extends StatelessWidget {
  const CrudoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crudo Store',
        theme: ThemeData(primarySwatch: Colors.green),
        home: const HomeScreen(),
      ),
    );
  }
}

//////////////////////
// MODEL
//////////////////////

class CartItem {
  final String name;
  final double price;

  CartItem({required this.name, required this.price});
}

//////////////////////
// SERVICE
//////////////////////

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get count => _items.length;

  double get totalPrice =>
      _items.fold(0.0, (sum, item) => sum + item.price);

  void addItem(String name, double price) {
    _items.add(CartItem(name: name, price: price));
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}

//////////////////////
// HOME SCREEN
//////////////////////

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crudo Store'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon
