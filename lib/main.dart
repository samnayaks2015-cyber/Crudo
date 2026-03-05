import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'utils/theme.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const CrudoApp());
}

class CrudoApp extends StatelessWidget {
  const CrudoApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "CRUDO",

      theme: AppTheme.lightTheme,

      initialRoute: "/login",

      routes: {

        "/login": (context) => const LoginScreen(),

        "/home": (context) => const HomeScreen(),

        "/profile": (context) => const ProfileScreen(),

      },

    );
  }
}
