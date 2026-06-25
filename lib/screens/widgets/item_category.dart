import 'package:flutter/material.dart';

class ItemCategory extends StatelessWidget {
  final String title;
  final String image;
  final Color color;
  const ItemCategory({
    super.key,
    required this.title,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Image.asset(
              "assets/icons/$image",
              fit: BoxFit.contain,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w300)),
      ],
    );
  }
}
