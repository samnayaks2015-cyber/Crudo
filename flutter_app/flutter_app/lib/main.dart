import 'package:flutter/material.dart';

void main() {
  runApp(const CrudoApp());
}

class CrudoApp extends StatelessWidget {
  const CrudoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUDO',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CRUDO'),
          backgroundColor: Colors.green,
        ),
        body: const Center(
          child: Text(
            'CRUDO Milk & Fresh Delivery',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
