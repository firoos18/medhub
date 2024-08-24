import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medhub/features/home/presentation/widgets/category_item.dart';

List<Category> categoryItems = [
  const Category(
    colors: [
      Color(0xffFF9598),
      Color(0xffFF70A7),
    ],
    imagePath: 'assets/images/dental.png',
    title: 'Dental',
  ),
  const Category(
    colors: [
      Color(0xff19E5A5),
      Color(0xff15BD92),
    ],
    imagePath: 'assets/images/wellness.png',
    title: 'welness',
  ),
  const Category(
    colors: [
      Color(0xffFFC06F),
      Color(0xffFF793A),
    ],
    imagePath: 'assets/images/homeo.png',
    title: 'Homeo',
  ),
  const Category(
    colors: [
      Color(0xff4DB7FF),
      Color(0xff3E7DFF),
    ],
    imagePath: 'assets/images/eye_care.png',
    title: 'Eye Care',
  ),
  const Category(
    colors: [
      Color(0xff828282),
      Color(0xff090F47),
    ],
    imagePath: 'assets/images/skin_hair.png',
    title: 'Skin & Hair',
  ),
];

class CategoryListview extends StatelessWidget {
  const CategoryListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Top Categories',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryItems.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 4),
            itemBuilder: (context, index) => CategoryItem(
              category: categoryItems[index],
            ),
          ),
        )
      ],
    );
  }
}
