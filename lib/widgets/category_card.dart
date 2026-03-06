import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {

  final String title;
  final String icon;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 90,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
          )
        ],
      ),

      child: Column(
        children: [

          Text(
            icon,
            style: const TextStyle(fontSize: 32),
          ),

          const SizedBox(height: 6),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          )

        ],
      ),
    );
  }
}
