import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    Key? key,
    required this.category,
    required this.color,
    required this.onTap, // New property for onTap
  }) : super(key: key);

  final String category;
  final Color color;
  final VoidCallback onTap; // Callback to be executed on tap

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Assigning the onTap callback
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Center(
            child: Text(
              category,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
