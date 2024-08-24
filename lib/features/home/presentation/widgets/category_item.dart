import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Category {
  final String title;
  final String imagePath;
  final List<Color> colors;

  const Category({
    required this.colors,
    required this.imagePath,
    required this.title,
  });
}

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed('category-details'),
      child: Container(
        margin: const EdgeInsets.only(left: 26),
        child: Column(
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: category.colors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Image.asset(
                category.imagePath,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              category.title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w300,
                color: const Color(0xff090F47).withOpacity(0.95),
              ),
            )
          ],
        ),
      ),
    );
  }
}
