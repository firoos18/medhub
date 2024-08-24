import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medhub/features/categories/presentation/widgets/diabetic_item.dart';

List<Diabetic> diabeticItems = [
  const Diabetic(
    imagePath: 'assets/images/sugar-substitute.png',
    title: 'Sugar Substitute',
  ),
  const Diabetic(
    imagePath: 'assets/images/juice-vinegar.png',
    title: 'Juice & Vinegars',
  ),
  const Diabetic(
    imagePath: 'assets/images/vitamins-medicine.png',
    title: 'Vitamins Medicines',
  ),
  const Diabetic(
    imagePath: 'assets/images/vitamins-medicine.png',
    title: 'Vitamins Medicines',
  ),
  const Diabetic(
    imagePath: 'assets/images/vitamins-medicine.png',
    title: 'Vitamins Medicines',
  ),
];

class DiabeticListview extends StatelessWidget {
  const DiabeticListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Diabetic Diet',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: diabeticItems.length,
            padding: const EdgeInsets.only(left: 24),
            itemBuilder: (context, index) => DiabeticItem(
              diabetic: diabeticItems[index],
            ),
          ),
        )
      ],
    );
  }
}
