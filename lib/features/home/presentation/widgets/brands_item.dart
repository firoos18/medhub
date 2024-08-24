import 'package:flutter/material.dart';

class Brands {
  final String title;
  final String imagePath;

  const Brands({
    required this.imagePath,
    required this.title,
  });
}

class BrandsItem extends StatelessWidget {
  final Brands brands;

  const BrandsItem({
    super.key,
    required this.brands,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 200,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.05),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                )
              ],
            ),
            child: Image.asset(
              brands.imagePath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              brands.title,
              textAlign: TextAlign.center,
              softWrap: false,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
