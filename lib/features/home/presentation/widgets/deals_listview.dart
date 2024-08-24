import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medhub/features/home/presentation/widgets/deals_item.dart';

List<Deals> dealsItem = [
  const Deals(
    imagePath: 'assets/images/deals_1.png',
    price: 112000,
    title: 'Accu-check Active Test Strip',
    rating: 4.2,
  ),
  const Deals(
    imagePath: 'assets/images/deals_2.png',
    price: 150000,
    title: 'Omron HEM-8712 BP Monitor',
    rating: 4.4,
  ),
  const Deals(
    imagePath: 'assets/images/deals_1.png',
    price: 150000,
    title: 'Accu-check Active Test Strip',
    rating: 4.7,
  ),
  const Deals(
    imagePath: 'assets/images/deals_2.png',
    price: 170000,
    title: 'Omron HEM-8712 BP Monitor',
    rating: 5.0,
  ),
];

class DealsListview extends StatelessWidget {
  const DealsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Deals of the Day',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                'More',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff00A59B),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: dealsItem.length,
            padding: const EdgeInsets.only(left: 24),
            itemBuilder: (context, index) => DealsItem(
              deals: dealsItem[index],
            ),
          ),
        )
      ],
    );
  }
}
