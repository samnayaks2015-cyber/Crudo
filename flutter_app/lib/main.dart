import 'package:flutter/material.dart';

void main() {
  runApp(const CrudoApp());
}

class CrudoApp extends StatelessWidget {
  const CrudoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crudo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Crudo App')),
        body: const Center(
          child: Text(
            'Crudo APK Build Success 🚀',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
