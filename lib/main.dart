import 'package:flutter/material.dart';

void main() {
  runApp(const CrudoApp());
}

class CrudoApp extends StatelessWidget {
  const CrudoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crudo Milk',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CRUDO MILK'),
          backgroundColor: Colors.green,
        ),
        body: const Center(
          child: Text(
            'Crudo Milk App Ready 🚀',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
