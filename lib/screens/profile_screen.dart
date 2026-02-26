import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: AppColors.primary,
      ),
      body: const Center(
        child: Text(
          "User Profile",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
