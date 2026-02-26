import 'package:flutter/material.dart';
import 'screens/main_navigation.dart';

void main() {
  runApp(const CrudoApp());
}

class CrudoApp extends StatelessWidget {
  const CrudoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUDO',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MainNavigation(),
    );
  }
}
