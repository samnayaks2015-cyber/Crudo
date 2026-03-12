import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

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

      initialRoute: '/',

      routes: {

        '/': (context) => const SplashScreen(),

        '/login': (context) => LoginScreen(),

        '/home': (context) => const HomeScreen(),

      },
    );
  }
}
