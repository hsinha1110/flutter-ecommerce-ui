import 'package:flutter/material.dart';

class ItemBanner extends StatelessWidget {
  final String image;

  const ItemBanner({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          "assets/images/$image",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
