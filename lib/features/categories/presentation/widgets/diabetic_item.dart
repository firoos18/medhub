import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Diabetic {
  final String title;
  final String imagePath;

  const Diabetic({
    required this.imagePath,
    required this.title,
  });
}

class DiabeticItem extends StatelessWidget {
  final Diabetic diabetic;

  const DiabeticItem({
    super.key,
    required this.diabetic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: const Color(0xffF5F7FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: SizedBox(
              width: 120,
              child: Image.asset(
                diabetic.imagePath,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 14),
            child: SizedBox(
              width: 70,
              height: 36,
              child: Text(diabetic.title),
            ),
          ),
        ],
      ),
    );
  }
}
