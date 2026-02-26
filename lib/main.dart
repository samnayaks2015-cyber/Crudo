import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/cart_service.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CrudoApp());
}

class CrudoApp extends StatelessWidget {
  const CrudoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartService(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRUDO',
        home: HomeScreen(),
      ),
    );
  }
}
