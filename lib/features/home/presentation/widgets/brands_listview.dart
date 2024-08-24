import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medhub/features/home/presentation/widgets/brands_item.dart';

List<Brands> brandsItem = [
  const Brands(
    imagePath: 'assets/images/himalaya.png',
    title: 'Himalaya Wellness',
  ),
  const Brands(
    imagePath: 'assets/images/accu-check.png',
    title: 'Accu-Check',
  ),
  const Brands(
    imagePath: 'assets/images/vlcc.png',
    title: 'Vlcc',
  ),
  const Brands(
    imagePath: 'assets/images/protinex.png',
    title: 'Protinex',
  ),
];

class BrandsListview extends StatelessWidget {
  const BrandsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            'Featured Brands',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: brandsItem.length,
            padding: const EdgeInsets.only(left: 24),
            itemBuilder: (context, index) => BrandsItem(
              brands: brandsItem[index],
            ),
          ),
        ),
      ],
    );
  }
}
